# Maintainer: agony <27015 at riseup dot net>

pkgname=jdk-openjdk-ea
pkgver=28+22
pkgrel=1
_major=${pkgver%%+*}
pkgdesc="OpenJDK ${_major} early access build, compiled from the openjdk/jdk sources"
arch=('x86_64')
url="https://openjdk.org/"
license=('LicenseRef-Java')
depends=('java-runtime-common>=3' 'java-environment-common=3' 'ca-certificates-utils'
         'alsa-lib' 'freetype2' 'giflib' 'glibc' 'harfbuzz' 'lcms2' 'libgcc' 'libjpeg-turbo'
         'libpng' 'libstdc++' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
# The build accepts a boot JDK of the previous or the same major
makedepends=('java-environment>=27' 'bash' 'cpio' 'libcups' 'libxrandr' 'libxt' 'pandoc'
             'unzip' 'zip')
optdepends=('gtk3: GTK look and feel'
            'nss: SunPKCS11 with the NSS softtoken')
provides=("java-environment=${_major}"
          "java-environment-openjdk=${_major}"
          "java-runtime=${_major}"
          "java-runtime-openjdk=${_major}"
          "java-runtime-headless=${_major}"
          "java-runtime-headless-openjdk=${_major}")
backup=(etc/java-openjdk-ea/bash-completion/jcmd
        etc/java-openjdk-ea/jaxp.properties
        etc/java-openjdk-ea/jaxp-strict.properties.template
        etc/java-openjdk-ea/logging.properties
        etc/java-openjdk-ea/management/jmxremote.access
        etc/java-openjdk-ea/management/jmxremote.password.template
        etc/java-openjdk-ea/management/management.properties
        etc/java-openjdk-ea/net.properties
        etc/java-openjdk-ea/security/java.security
        etc/java-openjdk-ea/security/policy/README.txt
        etc/java-openjdk-ea/security/policy/limited/default_US_export.policy
        etc/java-openjdk-ea/security/policy/limited/default_local.policy
        etc/java-openjdk-ea/security/policy/limited/exempt_local.policy
        etc/java-openjdk-ea/security/policy/unlimited/default_US_export.policy
        etc/java-openjdk-ea/security/policy/unlimited/default_local.policy
        etc/java-openjdk-ea/sound.properties)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openjdk/jdk/archive/refs/tags/jdk-${pkgver}.tar.gz"
        'java.desktop'
        'jconsole.desktop'
        'jshell.desktop')
sha256sums=('1613359fc8d3d8c919fe783bd3d56d0704e4ea3d826fb29b280284c1bda19a2b'
            '3682e4ff646bf279b111fd9ae6565fdc7bb6fc01fe6adf19cb9dd0c0899c9fe5'
            'cd3bcb8acec426d4194021ebfe0830c5712eaa2c0910bc3dd3fccc3acf0c639b'
            '4ef04dd2b586c17734d0dc82c59ae0bf08e67b0a8d58fa7e1bb144fc8e7143f8')

_srcdir=jdk-jdk-${pkgver/+/-}
_imgdir=${_srcdir}/build/linux-${CARCH}-server-release/images
# No major version in the directory name, so the default set with
# archlinux-java survives the move of the tip to a new major
_jvmdir=/usr/lib/jvm/java-openjdk-ea

build() {
  cd "${_srcdir}"

  # The JDK build runs its own parallel jobs; -j in MAKEFLAGS breaks it
  local _j
  _j=$(sed -En 's/.*-j([0-9]+).*/\1/p' <<<"${MAKEFLAGS}")
  export MAKEFLAGS=${MAKEFLAGS/-j${_j}/}

  # configure ignores CFLAGS, CXXFLAGS and LDFLAGS from the environment;
  # the flags go in through --with-extra-*, as in extra/java-openjdk
  local _cflags="${CFLAGS//-O2/-O3} ${CPPFLAGS} -fcommon"
  local _cxxflags="${CXXFLAGS//-O2/-O3} ${CPPFLAGS} -fcommon"
  local _ldflags=${LDFLAGS}
  _cflags=${_cflags/-fexceptions/}
  _cxxflags=${_cxxflags/-fexceptions/}
  unset CFLAGS CXXFLAGS LDFLAGS

  local _features="zgc,shenandoahgc"
  if check_option "lto" "y"; then
    _features+=",link-time-opt"
  fi

  bash configure \
    --with-version-pre=ea \
    --with-version-build="${pkgver#*+}" \
    --without-version-opt \
    --with-stdc++lib=dynamic \
    --with-extra-cflags="${_cflags}" \
    --with-extra-cxxflags="${_cxxflags}" \
    --with-extra-ldflags="${_ldflags}" \
    --with-libjpeg=system \
    --with-giflib=system \
    --with-libpng=system \
    --with-lcms=system \
    --with-zlib=system \
    --with-harfbuzz=system \
    --with-jvm-features="${_features}" \
    --with-native-debug-symbols=none \
    --disable-warnings-as-errors

  make images
}

check() {
  "${_imgdir}/jdk/bin/java" -version
}

package() {
  install -dm755 "${pkgdir}${_jvmdir}" "${pkgdir}/etc" "${pkgdir}/usr/share/licenses"
  cp -a "${_imgdir}/jdk"/* "${pkgdir}${_jvmdir}"
  cd "${pkgdir}${_jvmdir}"

  # The JDK reads its configuration from ${java.home}/conf; keeping it in
  # /etc lets pacman preserve local edits, as extra/jdk-openjdk does
  mv conf "${pkgdir}/etc/java-openjdk-ea"
  ln -s /etc/java-openjdk-ea conf

  mv legal "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}" legal

  # The system Java keystore from ca-certificates-utils
  ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

  local f
  for f in java jconsole jshell; do
    install -Dm644 "${srcdir}/${f}.desktop" \
      "${pkgdir}/usr/share/applications/${f}-java-openjdk-ea.desktop"
    sed -i "s/@MAJOR@/${_major}/g" "${pkgdir}/usr/share/applications/${f}-java-openjdk-ea.desktop"
  done

  local s
  for s in 16 24 32 48; do
    install -Dm644 "${srcdir}/${_srcdir}/src/java.desktop/unix/classes/sun/awt/X11/java-icon${s}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/java-openjdk-ea.png"
  done
}

# Maintainer: agony <27015 at riseup dot net>

pkgname=jdk-temurin-ea-bin
pkgver=28+21
pkgrel=1
_major=${pkgver%%+*}
pkgdesc="Temurin ${_major} early access build, OpenJDK binaries by Adoptium"
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url="https://adoptium.net/temurin/"
license=('LicenseRef-Java')
depends=('java-runtime-common>=3' 'java-environment-common=3' 'ca-certificates-utils'
         'alsa-lib' 'glibc' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst')
optdepends=('gtk3: GTK look and feel')
provides=("java-environment=${_major}"
          "java-environment-openjdk=${_major}"
          "java-runtime=${_major}"
          "java-runtime-openjdk=${_major}"
          "java-runtime-headless=${_major}"
          "java-runtime-headless-openjdk=${_major}")
backup=(etc/java-temurin-ea/bash-completion/jcmd
        etc/java-temurin-ea/jaxp.properties
        etc/java-temurin-ea/jaxp-strict.properties.template
        etc/java-temurin-ea/logging.properties
        etc/java-temurin-ea/management/jmxremote.access
        etc/java-temurin-ea/management/jmxremote.password.template
        etc/java-temurin-ea/management/management.properties
        etc/java-temurin-ea/net.properties
        etc/java-temurin-ea/security/java.security
        etc/java-temurin-ea/security/policy/README.txt
        etc/java-temurin-ea/security/policy/limited/default_US_export.policy
        etc/java-temurin-ea/security/policy/limited/default_local.policy
        etc/java-temurin-ea/security/policy/limited/exempt_local.policy
        etc/java-temurin-ea/security/policy/unlimited/default_US_export.policy
        etc/java-temurin-ea/security/policy/unlimited/default_local.policy
        etc/java-temurin-ea/sound.properties)
install="${pkgname}.install"
options=('!strip')
_release="https://github.com/adoptium/temurin${_major}-binaries/releases/download/jdk-${pkgver}-ea-beta"
_file="linux_hotspot_${pkgver/+/_}-ea.tar.gz"
# The JDK icons, as extra/java-openjdk installs them, from the tag this build was made from
_icons="https://raw.githubusercontent.com/adoptium/jdk/jdk-${pkgver}_adopt/src/java.desktop/unix/classes/sun/awt/X11"
source=('java.desktop'
        'jconsole.desktop'
        'jshell.desktop'
        "java-icon16-${pkgver}.png::${_icons}/java-icon16.png"
        "java-icon24-${pkgver}.png::${_icons}/java-icon24.png"
        "java-icon32-${pkgver}.png::${_icons}/java-icon32.png"
        "java-icon48-${pkgver}.png::${_icons}/java-icon48.png")
source_x86_64=("${_release}/OpenJDK-jdk_x64_${_file}")
source_aarch64=("${_release}/OpenJDK-jdk_aarch64_${_file}")
source_powerpc64le=("${_release}/OpenJDK-jdk_ppc64le_${_file}")
source_riscv64=("${_release}/OpenJDK-jdk_riscv64_${_file}")
sha256sums=('e269163fa682197c04252ca202f1239965dfe842173e154cf75df954edb0314f'
            '31ab0695198b879fce8284e3705cd3e6866d9aabdf8e22caa5cffdefd4eaebde'
            '75cd709a4500df8dd027d615358890ec8d2642c35e10be3e3f4739671626ba5e'
            'fc8a191aa0c78850194758c77937966cc5bd0fbd2b604188b466571ebcdae570'
            'c9079bc3676873b39967861c24036074bf6d224442994b4c4ce79e888602fcd5'
            '8b2491d0b5cbc67075dcae4d29c8a92b9ab813d9eca05a2f16ee3b3efb970e65'
            'e15912c341217081f40f73a89203c765e501470ef3a01099c1995139214ff4d6')
sha256sums_x86_64=('ee4f37d70b9f4081eda1b936eb0582d4ffbf2ea9838a0e7d0eba762cb90fa088')
sha256sums_aarch64=('12053ae89e4029d1d95ce6ca3e8c49a8a133a58ef057903068f17344e15ffac4')
sha256sums_powerpc64le=('2eefff71d4cf2feb89fb4bc1743d729e5b85fa21374fce6c94ae227741d6e8c6')
sha256sums_riscv64=('3a8ef13f99dc0f6ae0413ad358fdfa6d896435e614ff2d02cc0cbf3e0fa88398')

# No major version in the directory name, so the default set with
# archlinux-java survives the move of the tip to a new major
_jvmdir=/usr/lib/jvm/java-temurin-ea

package() {
  install -dm755 "${pkgdir}${_jvmdir}" "${pkgdir}/etc" "${pkgdir}/usr/share/licenses"
  cp -a "jdk-${pkgver}"/* "${pkgdir}${_jvmdir}"
  cd "${pkgdir}${_jvmdir}"

  # The JDK reads its configuration from ${java.home}/conf; keeping it in
  # /etc lets pacman preserve local edits, as extra/jdk-openjdk does
  mv conf "${pkgdir}/etc/java-temurin-ea"
  ln -s /etc/java-temurin-ea conf

  mv legal "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}" legal

  # The system Java keystore from ca-certificates-utils
  ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

  local f
  for f in java jconsole jshell; do
    install -Dm644 "${srcdir}/${f}.desktop" \
      "${pkgdir}/usr/share/applications/${f}-java-temurin-ea.desktop"
    sed -i "s/@MAJOR@/${_major}/g" "${pkgdir}/usr/share/applications/${f}-java-temurin-ea.desktop"
  done

  local s
  for s in 16 24 32 48; do
    install -Dm644 "${srcdir}/java-icon${s}-${pkgver}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/java-temurin-ea.png"
  done
}

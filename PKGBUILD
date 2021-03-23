# Maintainer: Vitor Rodrigues <vitor dot rodrigues at gmail dot com>
# Contributor: pappy@a_s_c_e_l_i_o_n.c_o_m

pkgname=dbeaver-ce
pkgver=21.0.1
pkgrel=1
pkgdesc="Free Universal SQL Client for Developers and Database Administrators (Community Edition)"
arch=('x86_64')
url="https://dbeaver.io/"
license=("Apache")
depends=('java-runtime>=11' 'gtk3' 'gtk-update-icon-cache' 'libsecret')
makedepends=('maven' 'java-runtime<15')
optdepends=('dbeaver-plugin-office: export data in Microsoft Office Excel format'
            'dbeaver-plugin-svg-format: save diagrams in SVG format')
install="${pkgname}.install"
provides=(dbeaver-ce)
conflicts=(dbeaver-ce-bin)

source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/serge-rider/dbeaver/archive/${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "${pkgname}.profile.gz"
        "${pkgname}.hook")
sha256sums=('f7ebd07bb85022d715df48e191f24293af23eadc29478c402fd67e871fa4dc0f'
            'a53bcfa37f71e96fdc0ba3df6748d147f29fcb3bc7f35ffad9d876f3e2b072aa'
            'ba3c2248960b2b5c6eafa227ec9bd1223e21287a991cd3b912f0b0a984666c80'
            '1863e74bdcf22b7328e6e8487cbebff7d5360e34bde85c1dd226b168b4737034'
            '131e3eb7b97723aa17c08db23a8b588fedef3d99941de1177b90ba3917459bf0')

noextract=("${source[@]%%::*}")

prepare() {
  # Decompress source
  mkdir -p $srcdir/${pkgname}-${pkgver}
  tar -xf "$srcdir/${pkgname}-${pkgver}.tar.gz" --strip=1 -C "$srcdir/${pkgname}-${pkgver}"

  # Fix version number in profile file
  gzip --decompress --keep --stdout "${pkgname}.profile.gz" | 
    sed "s/DBEAVER_VERSION/${pkgver}/g" |
    gzip -9 > "${pkgname}.profile-${pkgver}.gz"
  rm "${pkgname}.profile.gz"

  # Avoid the use of any Java 15, actually incompatible with the build
  export JAVA_HOME="/usr/lib/jvm/$(archlinux-java status | tail -n +2 | sort | cut -d ' ' -f 3 | sort -nr -k 2 -t '-' | grep -v '15-openjdk' -m 1)"
  
  # Download dependencies during prepare FS#55873
  # https://bugs.archlinux.org/task/55873
  cd "${pkgname}-${pkgver}"
  export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"
  mvn --batch-mode validate
}

build() {
  cd "${pkgname}-${pkgver}"
  mvn --batch-mode package
}

package() {
  cd "${pkgname}-${pkgver}/product/community"
  # Install icons into /usr/share/icons/hicolor
  for _size in 16 32 48 64 128 256 512
  do
    install -m 644 -D "icons-sources/icon_${_size}x${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done

  # Move into the target directory
  cd "target/products/org.jkiss.dbeaver.core.product/linux/gtk/${CARCH}"

  # Initially install everything into /usr/lib/dbeaver
  install -m 755 -d "${pkgdir}/usr/lib"
  cp -r "dbeaver" "${pkgdir}/usr/lib/${pkgname}"

  # Move shared data to /usr/share/dbeaver
  cd "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
  for _file in configuration features p2 .eclipseproduct artifacts.xml dbeaver.ini readme.txt
  do
    mv "${_file}" "${pkgdir}/usr/share/${pkgname}"
    ln -s "/usr/share/${pkgname}/${_file}" .
  done

  # Install additional licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses"
  mv licenses "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install icons
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  mv dbeaver.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  mv icon.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"

  # Install executable script into /usr/bin
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install application launcher into /usr/share/applications
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"

  # Clean up and install new profile
  rm -rf "${pkgdir}/usr/share/${pkgname}/p2/org.eclipse.equinox.p2.core"
  cd "${pkgdir}/usr/share/${pkgname}/p2/org.eclipse.equinox.p2.engine/profileRegistry/DefaultProfile.profile"
  find . -name "*.profile.gz" -delete
  install -m 644 "${srcdir}/${pkgname}.profile-${pkgver}.gz" "1502633007017.profile.gz"
  cd "${pkgdir}/usr/share/${pkgname}/p2/org.eclipse.equinox.p2.engine"
  rm -f ".settings/org.eclipse.equinox.p2.artifact.repository.prefs"
  rm ".settings/org.eclipse.equinox.p2.metadata.repository.prefs"
  rmdir ".settings"

  # Install system hook
  install -m 755 -d "${pkgdir}/usr/share/libalpm/hooks"
  install -m 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks"

  # Create configuration file (handled by the hook)
  cd "${pkgdir}/usr/share/${pkgname}/configuration/org.eclipse.equinox.simpleconfigurator"
  install -m 755 -d "${pkgdir}/etc/${pkgname}/bundles.d"
  mv "bundles.info" "${pkgdir}/etc/${pkgname}/bundles.d/00-${pkgname}.info"
  ln -s "/etc/${pkgname}/bundles.info" .
}

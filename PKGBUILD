# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Arthur Zamarin arthurzam gmail
# Forked from eclipse PKGBUILD
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Pablo Nicolas Diaz <pablonicolas.diaz@gmail.com>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>

# TODO: Integrate with other eclipse packages
#   move from /usr/share to /usr/lib
#   remove items from common and other libs
#   remove conflicts
#   separate parts into split packages
#   Eclipse packages are in too much turmoil to do this
# TODO: Figure out dbf imports, dbf-jdbc
#   http://www.csv-jdbc.com/stels_dbf_jdbc.htm

# To get started, File New Other, Business Intelligence and Reporting Tools, Report

set -u
_internal_pkgver='R'
_version='mars'
_package='reporting'
pkgname="eclipse-${_package}"
pkgver=4.5.0
pkgrel=1
pkgdesc='An IDE for Java and other languages - JEE + BIRT package'
arch=('i686' 'x86_64')
url='http://eclipse.org'
license=('EPL/1.1')
depends=('java-environment>=6' 'gtk2>=2.16.1' 'xulrunner>=1.9.0.10') # 'unzip'
#makedepends=('zip')
#provides=("eclipse=${pkgver}" 'eclipse-wtp-wst=3.1.1' 'eclipse-wtp=3.1.1' 'eclipse-dtp=1.7.2' 'eclipse-emf=2.5.0')
#conflicts=('eclipse')
options=('!strip')
install='eclipse.install'
source=('http://svgicons.o7a.net/unofficial/eclipse.svg')
source_x86_64=("ftp://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/${_version}/${_internal_pkgver}/eclipse-${_package}-${_version}-${_internal_pkgver}-linux-gtk-x86_64.tar.gz")
source_i686="${source_x86_64[@]/-x86_64/}"
sha256sums=('daac56ff0f7e4d2da534516cdd07b0f0a9dab85cdba7c9df8bb7bbbfa7e937a2')
sha256sums_i686=('98aaa9737d6dc7e74d72ece61ff00f717c24839be2027291b50b718656da5ee3')
sha256sums_x86_64=('2d1b0a9e26cbbab09a09a49867dd03ab27eb8a5ae1159cb67e7591a55d8bdbca')
PKGEXT='.pkg.tar.gz' # xz is only saves 10MB for 3 minutes extra compress time

pkgver() {
  set -u
  cd 'eclipse'
  sed -n -e 's:^eclipse.buildId=\(.*\)\.I.*$:\1:p' 'configuration/config.ini'
  set +u
}

prepare() {
  set -u
  # cd 'eclipse'

  # patch to increase default memory limits
  # patch -Np0 -i "${srcdir}/eclipse.ini.patch"
  set +u
}

package() {
  set -u
  local _eclipse='usr/share/eclipsereporting'
  # install eclipse
  install -d "${pkgdir}/${_eclipse}"
  mv 'eclipse' "${pkgdir}/${_eclipse}/"
  _eclipse="${_eclipse}/eclipse"

  # install misc
  install -Dm755 <(cat << EOF
#!/usr/bin/sh
export ECLIPSE_HOME='/${_eclipse}'
#export GDK_NATIVE_WINDOWS=true
\${ECLIPSE_HOME}/eclipse $@
EOF
  ) "${pkgdir}/usr/bin/eclipse"

  install -Dm644 <(cat << EOF
[Desktop Entry]
Name=Eclipse Reporting (BIRT)
Comment=A Java Development Environment
Icon=eclipse
Exec=/usr/bin/eclipse
Terminal=false
Type=Application
Categories=GNOME;Application;Development;
StartupNotify=true
EOF
  ) "${pkgdir}/usr/share/applications/eclipse.desktop"

  mkdir -p "${pkgdir}/usr/share/icons/hicolor"/{16x16,32x32,48x48}/apps
  shopt -s failglob
  local _png
  cd "${pkgdir}"
  #_png=("usr/lib/eclipse/plugins/org.eclipse.platform_${pkgver}."*/eclipse.png); test "${#_png}" -eq 1
  #ln -sf "/${_png}"   "${pkgdir}/usr/share/icons/hicolor/16x16/apps/eclipse.png"
  _png=("${_eclipse}/plugins/org.eclipse.platform_${pkgver}."*/eclipse32.png); test "${#_png[@]}" -eq 1
  ln -sf "/${_png}" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/eclipse.png"
  _png=("${_eclipse}/plugins/org.eclipse.platform_${pkgver}."*/eclipse48.png); test "${#_png[@]}" -eq 1
  ln -sf "/${_png}" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/eclipse.png"
  shopt -u failglob

  install -Dpm644 "${srcdir}/eclipse.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/eclipse.svg"
  set +u
}
set +u

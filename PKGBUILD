# Contributor: Julie Shapiro <jshapiro at nvidia dot com>

pkgname=p4v
_version=2025.2
pkgver=2025.2.2796382
pkgrel=1
pkgdesc="Perforce Helix Visual Client"
arch=('x86_64')
url="https://www.perforce.com"
license=('custom:p4v')
depends=('libxcb' 'qt6-base')
options=('!strip')

_url="${url}/downloads/perforce"
_filename="$(date +%Y%m%d)-p4v-${pkgver}.tgz"

source=(p4v.desktop
        p4admin.desktop
        p4merge.desktop
        LICENSE
        "${_filename}"::"${_url}/r${pkgver:2:4}/bin.linux26x86_64/${pkgname}.tgz")

sha256sums=('e2c5380997980f12ece4a92d558fc681deacfaa9273838e67be1a4298a99f032'
            'fda6ab6585ba26625879b104c2c99645915055bd752d5ba574c5c83b7f8b230c'
            '5b07d4373062825e463580bfec18db7346b457dc2a86678e3dfed84c7cbd3299'
            'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32'
            '5d8830345260a3a1794a53c558ad4df8a5871871131979ee98dfde9852c6f33a')

# Perforce Software (Package Signing) <support+packaging@perforce.com>
# validpgpkeys=('7123CB760FF18869'
#               'E58131C0AEA7B082C6DC4C937123CB760FF18869')

pkgver() {
  # grab the build version from the downloaded file itself
  echo "${_version}.$(find ${srcdir} -type d -name ${pkgname}-${pkgver:0:7}'*' | head -n1 | awk -F'.' '{print $(NF)}')"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"

  mkdir -p "${pkgdir}"/usr/share/p4v/bin/

  install -sm755 bin/{p4admin.bin,p4merge.bin,p4v.bin,QtWebEngineProcess} "${pkgdir}/usr/share/p4v/bin"
  install -m755 bin/{p4admin,p4merge,p4v,p4vc} "${pkgdir}/usr/share/p4v/bin"
  install -m644 bin/qt.conf "${pkgdir}/usr/share/p4v/bin"

  mkdir -p "${pkgdir}"/usr/bin
  # put a pointer in /usr/bin
  ln -s ../share/p4v/bin/{p4v,p4merge,p4admin,p4vc} "${pkgdir}"/usr/bin

  # Install icons
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/scalable/apps
  install -Dm644 lib/P4VResources/icons/p4admin.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/p4admin.svg
  install -Dm644 lib/P4VResources/icons/p4merge.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/p4merge.svg
  install -Dm644 lib/P4VResources/icons/p4v.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/p4v.svg

  mkdir -p "${pkgdir}"/usr/share/p4v/lib/
  # move everything else
  cp -R lib/* "${pkgdir}/usr/share/p4v/lib"

  cd "$srcdir"
  # Install desktop files
  mkdir -p "${pkgdir}"/usr/share/applications
  install -m644 {p4v,p4merge,p4admin}.desktop "${pkgdir}"/usr/share/applications

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

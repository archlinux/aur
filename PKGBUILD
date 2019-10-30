# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=p4v
pkgver=2019.2.1856742
pkgrel=1
pkgdesc="Perforce Visual Client"
arch=('x86_64')
url="http://www.perforce.com"
license=('custom:p4v')
depends=(libxcb)
options=('!strip')
source=(p4v.desktop
        p4admin.desktop
        p4merge.desktop
        LICENSE
        p4v-${pkgver}.tgz::http://cdist2.perforce.com/perforce/r${pkgver:2:4}/bin.linux26x86_64/${pkgname}.tgz)

sha256sums=('1fc7ea925fdcb38915f191b6a9c85fb46db9ef501dbaa077e8f38876c5e8fda0'
            '10e470c6099459a072565494c4fd21cc1f4198f1024fe6fdeb6c77ea7e594827'
            '139c5e4951ea9ab040912ef1f9705de16a37d32fdf7b8c7116eb5a785829c634'
            'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32'
            '0702a2bfcbbe63ab34a2398535c19413bb60cd9c85d6c6b92e6319c620959521')

# Perforce Software (Package Signing) <support+packaging@perforce.com>
# validpgpkeys=('7123CB760FF18869'
#               'E58131C0AEA7B082C6DC4C937123CB760FF18869')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"

  mkdir -p "${pkgdir}"/usr/share/p4v/bin/

  install -sm755 bin/{helixmfa,p4admin.bin,p4merge.bin,p4v.bin,p4vc.bin,QtWebEngineProcess} "${pkgdir}/usr/share/p4v/bin"
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

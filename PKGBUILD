# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom < tomgparchaur at gmail dot com >
# Contributor: David Manouchehri <d@32t.ca>

pkgname=dropbox-gtk2
pkgver=2.10.52
pkgrel=2
pkgdesc='A free service that lets you bring your photos, docs, and videos anywhere and share them easily (GTK2 version)'
arch=('i686' 'x86_64')
url='https://www.dropbox.com/'
license=('custom')
depends=('dbus-glib' 'gtk2' 'libsm')
provides=('dropbox')
conflicts=('dropbox' 'dropbox-experimental')
options=('!strip' '!upx')

source=(
  'dropbox.png'
  'dropbox.desktop'
  'dropbox.service'
  'dropbox@.service'
  'TERMS'
)

sha1sums=(
  '64073af76a2bbc7dba4a6886b82af0bb3e71a2a0'
  'd5ad720762b9052a4fd6af839038318b37d5fd39'
  'fde4a0eb9738a78f74b033dc30d15128563c1311'
  '59872dcac4cd48a65060df11a86b7d776548fe2a'
  '46ba3146324c0ca0209ac76eaaddd74d9fec94ac'
)

_arch='x86_64'

if [ "${CARCH}" == 'i686' ]; then
  _arch='x86'
  sha1sums+=('8a600f3a1171d00ce15cbbf5ab1c35a2a8bd18eb')
else
  sha1sums+=('0811b6f344e308a68b3c36421dc27f5db8948e15')
fi

source+=("https://dl.dropboxusercontent.com/u/17/dropbox-lnx.${_arch}-${pkgver}.tar.gz")

package() {
	install -d "${pkgdir}/opt"
	cp -R "${srcdir}/.dropbox-dist/dropbox-lnx.${_arch}-${pkgver}" "${pkgdir}/opt/dropbox"

	find "${pkgdir}/opt/dropbox/" -type f -exec chmod 644 {} \;
	chmod 755 "${pkgdir}/opt/dropbox/dropboxd"
	chmod 755 "${pkgdir}/opt/dropbox/dropbox"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/dropbox/dropbox" "${pkgdir}/usr/bin/dropbox"
	ln -s "/opt/dropbox/dropboxd" "${pkgdir}/usr/bin/dropboxd"

	install -Dm644 "${srcdir}/dropbox.desktop" "${pkgdir}/usr/share/applications/dropbox.desktop"
	install -Dm644 "${srcdir}/dropbox.png" "${pkgdir}/usr/share/pixmaps/dropbox.png"
	install -Dm644 "${srcdir}/dropbox.service" "${pkgdir}/usr/lib/systemd/user/dropbox.service"
	install -Dm644 "${srcdir}/dropbox@.service" "${pkgdir}/usr/lib/systemd/system/dropbox@.service"
  install -Dm644 "${srcdir}/TERMS" "${pkgdir}/usr/share/licenses/$pkgname/TERMS"

	rm -f "${pkgdir}/opt/dropbox/library.zip"
	ln -s dropbox "${pkgdir}/opt/dropbox/library.zip"
}

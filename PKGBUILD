pkgname=enpass-bin
_pkgname=enpass
pkgver=4.6.1
pkgrel=1
pkgdesc="A multiplatform password manager"
arch=('i686' 'x86_64')
url="http://enpass.io/"
license=('custom')
depends=('libxss')
install=enpass-bin.install
case $CARCH in
	'x86_64')
		_arch='amd64'
		sha256sums=(
			'f016afbcf4f5083ed42e0d80f2baa1b1e763b56d8009380de44efb1fa64b593e'
		)
		;;
	'i686')
		_arch='i386'
		sha256sums=(
			'6c9140794886b5441c4f82b57c865d1a84955bd87e29bd658546eea0b1343645'
		)
		;;
esac

source=(http://repo.sinew.in/pool/main/e/enpass/${_pkgname}_${pkgver}_${_arch}.deb)

package() {
	# Extract data
	tar xfz ${srcdir}/data.tar.gz -C ${pkgdir}/
	
	# Remove unnecessary files which are included in the .deb
	find ${pkgdir} -name ".DS_Store" -delete
	find ${pkgdir} -name "._.DS_Store" -delete
	find ${pkgdir} -name "._enpass.png" -delete

	# Update permissions to match the default system ones
	chmod 755 ${pkgdir}/opt/
	find ${pkgdir}/usr/ -type d -name "*" -exec chmod 755 {} \;

	# Symlink "runenpass.sh" to "/usr/bin" so it is accessible via terminal
	mkdir -p ${pkgdir}/usr/bin
	ln -s /opt/Enpass/bin/runenpass.sh ${pkgdir}/usr/bin/enpass
}

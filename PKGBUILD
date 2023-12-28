# Maintainer: Jan Dvorak <(firstname).(lastname) @ dvorak-sw.com>
pkgname=memopal
pkgver=3.7.1
pkgrel=1
pkgdesc="Online backup, storage, synchronization and file sharing tool, all-in-one."
arch=('x86_64')
url="https://www.memopal.com"
license=('custom')
depends=('ca-certificates' 'curl>=7.74.0' 'gcc-libs' 'glibc>=2.31' 'openssl-1.1' 'openssl>=1.1.1' 'zlib')
backup=('etc/memopal.conf')
source=('LICENSE'
        "${pkgname}.service"
        "${pkgname}-${pkgver}-amd64.deb::https://packages.memopal.com/deb/pool/non-free/m/memopal/${pkgname}_${pkgver}-deb11_amd64.deb")
sha512sums=('8c2f5f0a18c384db35aa17b1372a1f10c74109681fe6922e70f39f788a8396b50e15dbb443a22cb7397e22e4d33814e2771505150d6a192296aeb2d0a950652a'
            'cded6a4ae073b9586c1e071427e840269ddf2cefe3c59af141755b2e6997ed5b86a7c5c253f121a6fdee21706f4bac658bec3c6c90c193e4bf7597fd8ab3e97e'
            'a059422113ce97a9cbb964cfe9226b70ce60b86e040ea233545031052bb22ba66da22f08d25fdf8af62f82f67373a2a12e21eaf0ba45fe634c2f26de96e1db5a')
package() {
        # Extract package data, sysvinit related files not extracted
        cd ${srcdir}
        tar xf data.tar.xz -C "${pkgdir}" --exclude='etc/init.d' --exclude='*.gitkeep'

        # Fix memopal.conf settings
        sed -i 's#caCertPath=/etc/ssl/certs/ca-certificates.crt#caCertPath=/etc/ca-certificates/extracted/ca-bundle.trust.crt#g' "${pkgdir}"/etc/${pkgname}.conf
        sed -i 's#pidFilePath=/var/run/memopal.pid#pidFilePath=/run/memopal.pid#g' "${pkgdir}"/etc/${pkgname}.conf
        chmod 644 "${pkgdir}/etc/${pkgname}.conf"

        # Install license file
        # https://www.memopal.com/terms-of-use/
        install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

        # Install systemd service
        install -Dm 644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

	# Fix permissions
        chown root:root -R "${pkgdir}"
        chmod -R go-w "${pkgdir}"
	find "${pkgdir}/usr/share/icons/" -type f -exec chmod 644 {} +
}

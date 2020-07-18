# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="dkimpy-milter"
pkgver="1.2.1"
pkgrel=1
pkgdesc="DomainKeys Identified Mail (DKIM) milter in Python, with support for ed25519 signatures"
url="https://launchpad.net/dkimpy-milter"
arch=('any')
license=('GPL-2.0')
depends=('python' 'python-authres' 'python-pynacl' 'python-dkim' 'python-dnspython' 'python-pymilter' 'libmilter')
optdepends=('postfix: for sending mail')
source=("https://launchpad.net/${pkgname}/1.2/${pkgver=}/+download/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sysusers")
sha512sums=("4af1a4030d63a361fffe32513b29f5dc46ab2b1521d2b5aed5c0617a179f6056d8e046a47791b7c4d7e6aed6456c1311f225bd522a377d114ea951f37b4f68ff"
            "0c5cf3c9e6c3b8232d466edc997830845decf32c412c5943993a86db3e90834cb19bc57ef7ea4715fbd651fc6b8d0cbc70dc184ed30c359bbdc8bd477ab8c532")
backup=('etc/dkimpy-milter/dkimpy-milter.conf')
install="${pkgname}.install"

package(){
 mkdir -p "${pkgdir}/run/${pkgname}"
 mkdir -p "${pkgdir}/usr/lib/sysusers.d/"
 install -Dm 644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
 cd "${srcdir}/${pkgname}-${pkgver}"
 sed -e 's|local/bin|bin|g' -e 's|/usr/local/etc|/etc|g' -i system/dkimpy-milter.service
 awk '/UserID/ {sub(/dkimpy-milter/,"dkimpy-milter:dkimpy-milter")}1' etc/dkimpy-milter.conf > etc/dkimpy-milter.conf.tmp 
 mv etc/dkimpy-milter.conf.tmp etc/dkimpy-milter.conf
 python3 setup.py install --single-version-externally-managed --root="${pkgdir}/" --optimize=1
 mv "${pkgdir}/usr/etc/" "${pkgdir}"
 rm -r "${pkgdir}/etc/init.d/"
}

# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=exploitdb-git
pkgver=2024.04.22.r0.g9eb5c7b
pkgrel=1
pkgdesc="Offensive Security's Exploit Database Archive"
arch=('any')
conflicts=('exploitdb')
replaces=('exploitdb')
url="https://www.exploit-db.com/"
license=('GPL')
makedepends=('git' 'sed')
optdepends=('libxml2: to check nmap XML results'
            'xclip: copy paths to the clipboard'
            'exploitdb-papers: Addition to exploitdb to include documents and papers'
            'exploitdb-bin-sploits: bin exploits')
backup=('etc/searchsploit_rc')
options=('!strip')
source=("${pkgname%-git}::git+https://gitlab.com/exploit-database/${pkgname%-git}.git"
        "rcfile.diff")
sha512sums=('SKIP'
            'e170da5b974975c6c23c5b09e8c1825bbb17446fb506f2d00f92f86f94394acf18a53458bd90969de38da642fc1f7abb08ba940969108002dab17415b88211d6')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"

    patch -p1 -i "${srcdir}/rcfile.diff"
}

package() {
    # Added install binaries
    install -Dm755 "${srcdir}/${pkgname%-git}/searchsploit" "${pkgdir}/usr/bin/searchsploit"
    install -Dm644 "${srcdir}/${pkgname%-git}/.searchsploit_rc" "${pkgdir}/etc/searchsploit_rc"

    # Placing files into package destination
    mkdir -p "${pkgdir}/usr/share/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}/exploits/" "${pkgdir}/usr/share/${pkgname%-git}/"
    cp "${srcdir}/${pkgname%-git}/files_exploits.csv" "${pkgdir}/usr/share/${pkgname%-git}/"
    cp -r "${srcdir}/${pkgname%-git}/shellcodes/" "${pkgdir}/usr/share/${pkgname%-git}/"
    cp "${srcdir}/${pkgname%-git}/files_shellcodes.csv" "${pkgdir}/usr/share/${pkgname%-git}/"
    chmod -R 755 "${pkgdir}/usr/share/${pkgname%-git}/"
    find "${pkgdir}/usr/share/${pkgname%-git}/" -type f -exec chmod 644 {} \;

    # Installing license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
    install -m644 "${srcdir}/${pkgname%-git}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

# vim: ts=4 sw=4 et:

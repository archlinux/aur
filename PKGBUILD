# Maintainer: Colbie Dison <cdison at protonmail dot com>
_pkgname=ent
pkgname="${_pkgname}-git"
pkgver=r3.388d2cc
pkgrel=1
pkgdesc="Utility for testing random and pseudorandom sequences"
arch=(x86_64)
url="https://github.com/Fourmilab/ent_random_sequence_tester"
license=('CC-BY-SA-4.0')
depends=()
makedepends=('git')
provides=("${_pkgname}")
conflicts=()
source=("git+$url" 'https://manpages.debian.org/unstable/ent/ent.1.en.gz' 'Makefile.patch' 'totalcount.patch')
noextract=('ent.1.en.gz')
sha256sums=('SKIP'
            '47ce45cbc6536d59fdf913dc992c8539c707d63e0fa5606c87d47fe1ec107809'
            '8f716c1afd943234811a0802d27a4c2c170832d456ceb114193a18850c53d299'
            'f44e4ce1c4b7232d58af5404b67b4edf7984e39d24630e142066d46708f7c0cc')

pkgver() {
	cd "$srcdir/ent_random_sequence_tester"

	( set -o pipefail
	git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)" )
}

prepare() {
	cd "$srcdir/ent_random_sequence_tester/src"
	patch --strip 1 --input="${srcdir}/Makefile.patch"
	patch --strip 1 --input="${srcdir}/totalcount.patch"
}

build() {
	cd "${srcdir}/ent_random_sequence_tester/src"
	make
}

package() {
	install -Dm 0755    "${srcdir}/ent_random_sequence_tester/src/ent" \
		"${pkgdir}/usr/bin/ent"
	install -Dm 0644    "${srcdir}/ent.1.en.gz" \
		"${pkgdir}/usr/share/man/man1/ent.1.gz"
	install -Dm 0644 -T "${srcdir}/ent_random_sequence_tester/LICENSE.md" \
		"${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}

# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=cproc-git
pkgdesc='Small C11 compiler using QBE as backend'
pkgver=r592.9ae9aa6
pkgrel=1
url=https://git.sr.ht/~mcf/cproc
makedepends=(git)
arch=(x86_64)
depends=(gcc "qbe>=1.1")
license=(custom)
source=("${pkgname}::git+${url}")
b2sums=(SKIP)

pkgver ()
{
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build ()
{
	cd "${pkgname}"

	local ldso_option
	case ${CARCH} in
		x84_64) ldso_option='--with-ldso=/lib/ld-linux-x86-64.so.2' ;;
		i686)   ldso_option='--with-ldso=/lib/ld-linux.so.2' ;;
		*)      msg2 'Letting cproc choose the dynamic linker path' ;;
	esac

	make clean

	./configure \
		--prefix=/usr \
		--with-cpp=/usr/bin/cpp \
		--with-qbe=/usr/bin/qbe \
		--with-as=/usr/bin/as \
		--with-ld=/usr/bin/ld \
		${ldso_option}

	make
}

check ()
{
	make -C "${pkgname}" check
}

package ()
{
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" install

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.cproc"

	for filename in README.md doc/*.md ; do
		install -Dm644 README.md \
			"${pkgdir}/usr/share/doc/${pkgname}/${filename##*/}"
	done
}

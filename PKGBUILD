# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=cproc-git
pkgdesc='Small C11 compiler using QBE as backend'
pkgver=r352.f2e5c6f
pkgrel=1
url='https://git.sr.ht/~mcf/cproc'
makedepends=(git)
arch=(x86_64)
depends=(gcc)
license=(custom)
source=("${pkgname}::git+${url}"
        "${pkgname}-qbe::git+https://git.sr.ht/~mcf/qbe")
sha512sums=(SKIP
            SKIP)

pkgver ()
{
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare ()
{
	cd "${pkgname}"
	git submodule init
	git config submodule.qbe "${srcdir}/${pkgname}-qbe"
	git submodule update
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

	# cproc needs a version of qbe with a few fixes, which gets built
	# first and installed as cproc-qbe-backend. This needs to be available
	# also during bootstrap.
	msg2 'Building qbe...'
	make -C qbe LDFLAGS='-s'
	ln -nf qbe/obj/qbe cproc-qbe-backend

	msg2 'Cleaning cproc...'
	make clean

	msg2 'Building cproc...'
	./configure \
		--with-cpp=cpp \
		--with-qbe=cproc-qbe-backend \
		--with-as=as \
		--with-ld=ld \
		${ldso_option}

	PATH="$(pwd):${PATH}" make bootstrap CFLAGS='' LDFLAGS='-s' 
}

package ()
{
	cd "${pkgname}"
	install -Dm755 stage3/cproc "${pkgdir}/usr/bin/cproc"
	install -Dm755 stage3/cproc-qbe "${pkgdir}/usr/bin/cproc-qbe"
	install -Dm755 qbe/obj/qbe "${pkgdir}/usr/bin/cproc-qbe-backend"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.cproc"
	install -Dm644 qbe/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.qbe"

	for filename in README.md doc/*.md ; do
		install -Dm644 README.md \
			"${pkgdir}/usr/share/doc/${pkgname}/${filename##*/}"
	done
}

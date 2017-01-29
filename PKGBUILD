# Maintainer: Krakn <dan.ray.beste@gmail.com>

# Previous maintainer(s):
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname='mono-git'
_pkgname='mono'
pkgver=r109943.129f185e583
pkgrel=1
pkgdesc='Free implementation of the .NET platform including runtime and compiler'
url='http://www.mono-project.com/'
arch=(
    'i686'
    'x86_64'
)
license=(
    'custom=MITX11'
    'custom=MSPL'
    'BSD'
    'GPL'
    'LGPL2.1'
    'MPL'
)
depends=(
    'ca-certificates'
    'libgdiplus'
    'mono'
    'python'
    'sh'
    'zlib'
)
makedepends=(
    'git'
)
options=(
    '!makeflags'
)
provides=(
    'mono'
    'monodoc'
)
conflicts=(
    'mono'
    'monodoc'
)
source=(
    'git://github.com/mono/mono.git'
    'mono.binfmt.d'
)
sha256sums=(
    'SKIP'
    '9a657fc153ef4ce23bf5fc369a26bf4a124e9304bde3744d04c583c54ca47425'
)

pkgver() {
	cd "${srcdir}/${_pkgname}" || exit 1
	printf "r%s.%s"                     \
        "$(git rev-list --count HEAD)"	\
        "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}" || exit 1

	# Configure mono
	./autogen.sh                \
        --prefix=/usr           \
        --sysconfdir=/etc       \
        --bindir=/usr/bin       \
        --sbindir=/usr/bin      \
        --disable-quiet-build	\
        --with-mcs-docs=no

    # If mono is unable to bootstrap itself, make sure monolite is available
    make get-monolite-latest

	# Build mono
	make

	# Build jay
	cd "${srcdir}/${_pkgname}/mcs/jay" || exit 1
	make
}

package() {
	cd "${srcdir}/${_pkgname}" || exit 1
	make DESTDIR="${pkgdir}" install

	# Install jay
	cd "${srcdir}/${_pkgname}/mcs/jay" || exit 1
	make					        \
        DESTDIR="${pkgdir}"		    \
        prefix="/usr"			    \
        INSTALL="../../install-sh"	\
        install

	# Install binfmt conf file
	install	 -m644 -D "${srcdir}/mono.binfmt.d" \
        "${pkgdir}/usr/lib/binfmt.d/mono.conf"

	# Install license
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	install	-m644 -D "${srcdir}/${_pkgname}/LICENSE"    \
        "${pkgdir}/usr/share/licenses/${_pkgname}/"

	# Fix .pc file to be able to request mono on what it depends,
	# fixes #go-oo build
	sed -i -e "s:#Requires:Requires:" "${pkgdir}/usr/lib/pkgconfig/mono.pc"
}

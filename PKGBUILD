# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=python-pykeepass-git
_gitname=pykeepass
pkgver=2.8.2.r4.g0dc2f73
pkgrel=1
pkgdesc="Low-level library to interact with keepass databases"
arch=("any")
license=("GPL3")
url="https://github.com/pschmitt/pykeepass"
depends=("python" "python-pycryptodome" "python-lxml" "python-dateutil" "python-construct" "python-cffi" "python-argon2_cffi" "python-markupsafe" "python-pycparser")
makedepends=("python-setuptools")
provides=(python-pykeepass)
conflicts=(python-pykeepass)
source=("git+https://github.com/pschmitt/pykeepass.git"
        "0001-Set-UUID-when-creating-new-group.patch"
        "0001-Include-all-package-data.patch"
        "0001-Add-egg-info.patch")
sha512sums=('SKIP'
            '2b48f5e2bab56d94e95f8f045fef68e87d948a3f3548662be0bd1efd86032e240420ed97bc506299ebf77f9c12ac1099b1176f71bedcf217d3053c9403b3eb43'
            '01f89906a5350b314f5141c2590bd2d58d48fd4e714bc5c6f9f439be32180e0a20c49516a8c6cee5f56bef1d60187f26c5dca06b668e4b41392a25a523713447'
            '14eace890f4a1747600fcdad790aa719d908b9b64e8a49368fd5ebca348ad22d8ca8c5b80defd3664cc46e9c25000c984cd506445ed0df0125cc57a4b36fc81e')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
        cd "${srcdir}/${_gitname}/"
        # Fix broken group creation (missing uuid)
        patch -Np1 -i ../0001-Set-UUID-when-creating-new-group.patch
        # Don't miss package data
        patch -Np1 -i ../0001-Include-all-package-data.patch
        patch -Np1 -i ../0001-Add-egg-info.patch
}

package() {
        cd "${srcdir}/${_gitname}/"
        python setup.py install --root="${pkgdir}/" --optimize=1
        install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}


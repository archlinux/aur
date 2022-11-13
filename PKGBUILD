# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgbase=ymaudio
_gitname=YMAudio
pkgname=${_pkgbase}-git
pkgver=r18.082e86e
pkgrel=1
pkgdesc="Yandex.Music CLI Audio Player"
arch=('any')
url="https://apps.sdore.me/${_gitname}"
license=('LGPL3')
depends=('python-yandex-music-api' 'python-vlc' 'python-scurses' 'python-sutils' 'python-scimg')
optdepends=('python-notify2: for playback notifications when MPRIS is not available'
            'python-gobject: for MPRIS support'
            'dbus-python: for MPRIS support')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"

	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}"

	touch 'pyproject.toml'

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}"

	python -m installer --destdir="${pkgdir}" "dist/${_gitname}-"*.whl

	cd "${_gitname}"

	install -Dm755 'YMAudio' -t "${pkgdir}/usr/bin/"
	install -Dm644 'YMAudio.desktop' -t "${pkgdir}/usr/share/applications/"
}

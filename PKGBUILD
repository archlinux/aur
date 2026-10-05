# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: derchef <mjindra (at) derchef (dot) email>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Ray Rashif <schiv at archlinux dot org>
# Contributor: Brad Fanella <bradfanellaat archlinux dot us>

pkgname=eric
_name=eric7
pkgver=26.10
_pkgver="$(sed 's/\([0-9]\+\)\.\([0-9]\)\b/\1.0\2/g' <<<"${pkgver}")"
pkgrel=1
pkgdesc="A full-featured Python editor and IDE"
arch=('any')
url="https://eric-ide.python-projects.org/"
license=('GPL-3.0-or-later')
depends=('python'
         'python-asttokens'
         'python-chardet'
         'python-coverage'
         'python-docutils'
         'python-editorconfig'
         'python-fido2'
         'python-jedi'
         'python-markdown'
         'python-packaging'
         'python-psutil'
         'python-pygments'
         'python-pyqt6'
         'python-pyusb'
         'python-qscintilla-qt6'
         'python-requests'
         'python-semver'
         'python-tomlkit'
         'python-trove-classifiers'
         'python-watchdog'
         'python-yaml'
         'qt6-serialport'
         'qt6-tools'
         'qt6-websockets')
makedepends=('mercurial' 'python-build' 'python-installer' 'python-setuptools')
source=("hg+https://hg.die-offenbachs.homelinux.org:52443/eric#tag=release-${_pkgver}")
sha256sums=('aaf1fdf8aa075eda85a914b924a5ac404049808c3b8eb6f440c5d80b8f8fd381')

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    local eric_dir="${pkgdir}/${site_packages}/${_name}"
    install -Dm644 "${eric_dir}/data/linux/${_name}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
    for file in eric{,MPy,Tray,Web}; do
        install -Dm644 "${eric_dir}/pixmaps/${file}48_icon.png" "${pkgdir}/usr/share/pixmaps/${file}.png"
    done
    for file in "${_name}"_{ide,browser,mpy,tray}; do
        sed -i 's|@BINDIR@|/usr/bin|g' "${eric_dir}/data/linux/${file}.desktop"
        install -Dm644 "${eric_dir}/data/linux/${file}.desktop" -t "${pkgdir}/usr/share/applications"
    done
}

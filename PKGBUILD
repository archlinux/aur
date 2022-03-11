# Maintainer: XavRan <leandro.espinozar@protonmail.com>
# Contributor: Batuhan Baserdem <last.first@gmail.com>
# Based on powerline-console-fonts by; Simon Doppler <dopsi[at]dopsi[dot]ch>

_reponame='fonts'
pkgname=powerline-console-fonts-git
pkgver='r104.ge80e3eb'
pkgrel=1
pkgdesc="Various powerline patched fonts for the text console"
arch=('any')
url="https://github.com/powerline/${_reponame}"
license=('MIT')
source=("git+${url}")
sha512sums=('SKIP')
makedepends=('git')
provides=('powerline-console-fonts')
conflicts=('powerline-console-fonts')

pkgver() {
    git -C "${srcdir}/${_reponame}" describe --long --tags | \
        sed 's|\([0-9]\+.[0-9]\+.[0-9]\+.\)\([^-]*-g\)|r\2|;s|-|.|g;s|^v||g'
}

package() {
    # Installing psf version fonts
    for fdir in "$(find "${srcdir}/${_reponame}" -iname '*psf')" ; do
        bdir="$(dirname  "${fdir}")"
        name="$(basename "${bdir}" | tr '[:upper:]' '[:lower:]')"
        msg2 "Found ${name}, packaging..."
        # Install the license file
        install -Dm 664 "$(find "${bdir}" -iname '*license*' | head -n 1)" \
            "${pkgdir}/usr/share/licenses/${name}-consolefont"
        # Install the fonts
        find "${fdir}" -iname '*.psf*' -print0 |
            xargs -0 install -D -t "${pkgdir}/usr/share/kbd/consolefonts"
    done
}

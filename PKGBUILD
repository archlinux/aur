# $Id$
# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: Eric Bélanger <eric@archlinux.org>

# Type this to get the pgp keys:
#	$ gpg --keyserver pgp.mit.edu --recv-keys DB4B54CBA4826A18 2C393E0F18A9236D EBF01804BCF05F6B

pkgname=youtube-dl-latest
_pkgname=youtube-dl
pkgver="$(curl 'http://youtube-dl.org/latest/version')"
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.io/youtube-dl/"
license=('custom')
depends=('python' 'python-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
	    'atomicparsley: for embedding thumbnails into m4a files')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(http://youtube-dl.org/downloads/${pkgver}/${_pkgname}-${pkgver}.tar.gz
        http://youtube-dl.org/downloads/${pkgver}/${_pkgname}-${pkgver}.tar.gz.sig)
validpgpkeys=('7D33D762FD6C35130481347FDB4B54CBA4826A18'
        '428DF5D63EF07494BB455AC0EBF01804BCF05F6B'
        'ED7F5BF46B3BBED81C87368E2C393E0F18A9236D')

prepare() {
  cd ${_pkgname}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/completions|' setup.py
}

package() {
  cd ${_pkgname}
  python setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/share/bash-completion/completions/youtube-dl.bash-completion" \
     "${pkgdir}/usr/share/bash-completion/completions/youtube-dl"
  install -Dm644 youtube-dl.zsh "${pkgdir}/usr/share/zsh/site-functions/_youtube-dl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

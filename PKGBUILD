pkgname='python-bgutil-ytdlp-pot-provider'
_module='bgutil-ytdlp-pot-provider'
_src_folder='bgutil_ytdlp_pot_provider-1.2.2'
pkgver='1.2.2'
pkgrel=1
pkgdesc="PO Token provider plugin for yt-dlp"
url="https://github.com/Brainicism/bgutil-ytdlp-pot-provider"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('custom:GNU General Public License v3 (GPLv3)')
arch=('any')
source=("https://files.pythonhosted.org/packages/eb/2b/6ee7ce5eb7ec148ad43603f9ed6875c65f93668e62e41f3faae2abeeadca/bgutil_ytdlp_pot_provider-1.2.2.tar.gz")
sha256sums=('f597d7f453a3ceee24251405a5d769e1e3f31f39d5760670f273630fddae417e')

noextract=(${_src_folder}.tar.gz)
prepare() {
  bsdtar -xPf "${srcdir}/${_src_folder}.tar.gz" -C "$srcdir"
}

build() {
  cd "${srcdir}/${_src_folder}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_src_folder}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

post_install() {
  cat <<EOF
NOTICE: This package only installs the proof-of-orign token plugin for yt-dlp.
        It doesn't set up the actual POT provider! Luckly, setting it up is easy
        with docker:

            docker run \
              --name bgutil-provider \
              -d -p 4416:4416 \
              --init brainicism/bgutil-ytdlp-pot-provider

        If you find yourself running the provider a lot, you might want to
        consider passing "--restart always" to docker. You can read more about
        the provider setup on the upstream URL.
EOF
}

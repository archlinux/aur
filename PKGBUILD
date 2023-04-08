# Maintainer  : Thaodan          <AUR+me@thaodan.de>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=1.1.0
pkgrel=1
pkgdesc="Command line client for the openSUSE Build Service"
arch=(any)
url="https://github.com/openSUSE/osc"
license=('GPL2')
depends=('python'
         'python-m2crypto'
         'python-distro')
makedepends=('python-setuptools')
optdepends=('obs-build: required to run local builds'
            'obs-service-format_spec_file: for running the format_spec_file source service'
            'obs-service-download_files: for running the download_files source service'
            'python-keyring: keyring support'
            'python-progressbar: progressbar support for operations like uploading and services'
            )
conflicts=('osc-git' 'osc-bash-completion' 'zsh-completion-osc')
replaces=('osc-bash-completion' 'zsh-completion-osc')
source=("https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz"
        "_osc"
        0001-Add-sb2install-support-to-osc.patch
        0002-Support-osc-copyprj-in-api-by-Islam-Amer-usage-osc-c.patch
        0003-Support-synchronous-copyproj.patch
        0004-Add-p-to-copyprj-to-enable-copying-of-prjconf.patch
        0005-Add-support-for-rebuild-and-chroot-only-in-build.-re.patch
        0006-Add-architecture-and-scheduler-maps.patch
)
sha256sums=('ccbeb4a812d2518ec26b2509a54689641346d413fe88ad4f9770768c3016b6a7'
            '2b045e03d2fdce12683ceb9792d491a32f00b256045456412e7bc18c8726218a'
            '2fef5c0a42f331fdb892a69a80d036aba5e24921e881e74833018009d29c5649'
            'fbd42a43177351f677ed3eef085774c43d545723bc4f8b8bc7add8df57c565c3'
            '5a6cbb6375a83fa4dbb9103725b7e2b1d861edb3249f47f577bea94fac52d0c9'
            '3771bd3660635f193d8250778a01533c4a089d26b6355a8910aa33b9295efbdc'
            'df3de96be2dc05b1034539c439fc63cdba4257ca310c801d24a4a72843e60ba9'
            'eae5f978b8385db3acae46df96fc4973f306c4a640389165a8ac54469d370e5b')

prepare() {
  # Add 'Arch_Core' and 'Arch_Extra' as osc build targets
  sed -i "s|SLE_11_SP2|SLE_11_SP2 Arch_Core Arch_Extra|" _osc
  cd "${srcdir}/${pkgname}-${pkgver}"

  for patch in "$srcdir"/*.patch; do
    patch -p1 -i $patch
  done

  # Fix version
  sed -e "s/    version = \"%(describe:tags=true)\"/    version = \"$pkgver\"/"  \
      -i osc/util/git_version.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --prefix=/usr

  install -Dm644 contrib/complete.sh "${pkgdir}/usr/share/bash-completion/completions/osc"
  install -Dm755 contrib/osc.complete "${pkgdir}/usr/lib/osc/complete"
  install -Dm644 ../_osc "${pkgdir}/usr/share/zsh/site-functions/_osc"
}

# vim:set sts=2 ts=2 sw=2 et:

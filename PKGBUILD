# Maintainer  : Thaodan          <theodorstormgradex {at) gmail [dot} com>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=0.177.0
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
        0007-Trap-any-kind-of-exception-during-plugin-parsing-eg-.patch
)
sha256sums=('3dfeb9944f78f17a509966dd1dd89d177dd0d87856a6c8f7556d68e07521d1d4'
            '2b045e03d2fdce12683ceb9792d491a32f00b256045456412e7bc18c8726218a'
            'ed6607e642695028740efb53bfa1cb3e2efd97f1694e4a8efacf224b949d0962'
            'd09810c556e3170fdd0a058d090a6c3261af4e2032b6cf96fe63cef12c1e10e2'
            '1d3b37f662a74a1d070beb1cfe4cb0c1f2b1bf78503a6d7b69e2a3d46e516a4e'
            '7a68dc9b077523679b96b2a0520efb67d71fdcbf1d94ed6be3e06c2bfb768604'
            '8843a1c96702d18da0a029504990493d3a4417663916e83f21d96b2cee871c81'
            '68ecfb6f85bf34730191ef658f91cc29c2d2872ed0b0d2f814b3673e0841527d'
            '361bf935f382cf9ab34bd8e29c4f090c457293f97b705509997e2916aa17713b')

prepare() {
  # Add 'Arch_Core' and 'Arch_Extra' as osc build targets
  sed -i "s|SLE_11_SP2|SLE_11_SP2 Arch_Core Arch_Extra|" _osc
  cd "${srcdir}/${pkgname}-${pkgver}"

  for patch in "$srcdir"/*.patch; do
    patch -p1 -i $patch
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --prefix=/usr

  cd "${pkgdir}/usr/bin"
  ln -s osc-wrapper.py osc
  cd -

  install -Dm644 dist/complete.sh "${pkgdir}/usr/share/bash-completion/completions/osc"
  install -Dm755 dist/osc.complete "${pkgdir}/usr/lib/osc/complete"
  install -Dm644 ../_osc "${pkgdir}/usr/share/zsh/site-functions/_osc"
}

# vim:set sts=2 ts=2 sw=2 et:

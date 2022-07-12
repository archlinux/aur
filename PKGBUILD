# Maintainer  : Samuel Williams <samuel@oriontransfer.net>
# Contributor : Edvinas Valatka <edacval@gmail.com>
# Contributor : Jingbei Li <i@jingbei.li>

_pkgname=github-actions
pkgname=${_pkgname}-bin
pkgver=2.294.0
pkgrel=1
pkgdesc='GitHub Actions self-hosted runner tools.'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/actions/runner'
license=('MIT')

OPTIONS=(!strip !docs libtool emptydirs)

install=PKGBUILD

provides=($_pkgname)
conflicts=($_pkgname)
_common_source=(github-actions.service github-actions.tmpfiles github-actions.sysusers)
source=(
       "https://github.com/actions/runner/releases/download/v$pkgver/actions-runner-linux-x64-$pkgver.tar.gz"
       ${_common_source[@]}
)
source_armv6h=(
       "https://github.com/actions/runner/releases/download/v$pkgver/actions-runner-linux-arm-$pkgver.tar.gz"
       ${_common_source[@]}
)
source_armv7h=(${source_armv6h[@]})
source_aarch64=(
       "https://github.com/actions/runner/releases/download/v$pkgver/actions-runner-linux-arm64-$pkgver.tar.gz"
       ${_common_source[@]}
)

sha512sums=('6eb16dbb118606cc5c07e4dfaf5ee980739a3cf774f90172731875da3a32d6978cd8793bc7f79a5ee21d95e90e6375ee5e05d58169e3e3026e8ba3435aa6cca0' 'SKIP' 'SKIP' 'SKIP')
sha512sums_armv6h=('080c9bb99b462825df008a512a01e41ab5e0132144ff986dae657e0f33efb4fb2d60925bb4a613186a0db9357172b57e5aaa224bc04b54ccd2d61196941d940f' 'SKIP' 'SKIP' 'SKIP')
sha512sums_armv7h=('080c9bb99b462825df008a512a01e41ab5e0132144ff986dae657e0f33efb4fb2d60925bb4a613186a0db9357172b57e5aaa224bc04b54ccd2d61196941d940f' 'SKIP' 'SKIP' 'SKIP')
sha512sums_aarch64=('bff73901ae8da3f3aa99e2df5a17ef0c44343171cbdcdfad0788e1d75c8fc1141089e11544df10bfaf545203c3646db7dff13f77b53874ee17602a3c5d8bbe59' 'SKIP' 'SKIP' 'SKIP')

package() {
       depends=(sudo)
       mkdir -p "$pkgdir"/var/lib/$_pkgname

       # Useless on pacman-based distributions
       rm -f "$srcdir"/bin/installdependencies.sh

       cp -r -t "$pkgdir"/var/lib/$_pkgname "$srcdir"/{bin,externals,*.sh}

       # also see github-actions.tmpfiles
       chmod 0775 "$pkgdir"/var/lib/$_pkgname

       # make ldd happy
       chmod +x "$pkgdir"/var/lib/$_pkgname/bin/*.so

       install -Dm644 "$srcdir"/$_pkgname.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/$_pkgname.conf
       install -Dm644 "$srcdir"/$_pkgname.sysusers "${pkgdir}"/usr/lib/sysusers.d/$_pkgname.conf
       install -Dm644 "$srcdir"/$_pkgname.service  "${pkgdir}"/usr/lib/systemd/system/$_pkgname.service
}

pre_remove() {
       if systemctl -q is-enabled $_pkgname.service; then
              systemctl disable $_pkgname.service
       fi
}

post_remove() {
       echo
       echo "Remove $_pkgname user and this HOME /var/lib/$_pkgname manually, if not needed anymore."
       echo
}


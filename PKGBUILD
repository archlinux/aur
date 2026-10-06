# Maintainer: Anatoly Rugalev <anatoly.rugalev@gmail.com>
#
# Rendered by kubecom's packaging/aur/publish.sh from packaging/aur/PKGBUILD in
# github.com/neuroplastio/kubecom; change it there.
#
# The package carries two files (D295): the launcher, installed as
# /usr/bin/kubecom, and a complete kubecom binary as its "seed" at
# /usr/lib/kubecom/bin/kubecom. The launcher runs the seed when
# ~/.local/kubecom has no build yet, so a fresh install works with no network
# and does not depend on the channel being up; `kubecom update` then installs a
# newer build into ~/.local/kubecom, which the launcher prefers. pkgver is the
# release both files come from.
pkgname=kubecom-bin
_pkgname=kubecom
pkgver=26.10.06
pkgrel=2
pkgdesc="A fast, keyboard-driven terminal UI for Kubernetes (a launcher plus a seed build: kubecom updates itself in ~/.local/kubecom with kubecom update)"
arch=('x86_64' 'aarch64')
url="https://github.com/neuroplastio/kubecom"
license=('Apache-2.0')
provides=("$_pkgname")
# Both the 2020 package and this one install /usr/bin/kubecom, so pacman must
# refuse to have both: the 2020 binary is not an upgrade of this one.
conflicts=("$_pkgname" "kube-commander")
# Static Go binaries, stripped when they were built: no debug package, and
# nothing for strip to change about the bytes the sha256s below name.
options=('!strip' '!debug')

_release="https://github.com/neuroplastio/kubecom/releases/download/${pkgver}"
source_x86_64=("kubecom-launcher-${pkgver}-x86_64::${_release}/kubecom-launcher_linux_amd64"
               "kubecom-${pkgver}-x86_64::${_release}/kubecom_linux_amd64")
source_aarch64=("kubecom-launcher-${pkgver}-aarch64::${_release}/kubecom-launcher_linux_arm64"
                "kubecom-${pkgver}-aarch64::${_release}/kubecom_linux_arm64")
sha256sums_x86_64=('0b002a3ad53c4621fee6a0f0f42619adf12e8746cdf2da8c840a73995ab1dbd4' '1ef81bc89ec33477117e6911590a54a0b5341b06cac21fe56cbff256fede4777')
sha256sums_aarch64=('9b881e06e50dfb414ed7b520a97e48951b90eb668b1c868ffd931cd021044942' 'c5b7780dd5cd8bf222d711af7bfb22262005f70e27fb32fc7a42ed3f0ec2b12f')

package() {
  install -Dm755 "kubecom-launcher-${pkgver}-${CARCH}" "$pkgdir/usr/bin/$_pkgname"
  # The seed: enlaunch's default Seed is /usr/lib/<project>, and its bin/<name>
  # is what the launcher execs while the user's home has no build.
  install -Dm755 "kubecom-${pkgver}-${CARCH}" "$pkgdir/usr/lib/kubecom/bin/kubecom"
}

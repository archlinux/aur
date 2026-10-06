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
pkgver=26.10.07
pkgrel=1
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
sha256sums_x86_64=('e6ebfab74bb7b0a46f4b1192155fa23d22414d8b92110f0781a4787f64c735c5' '761b4935da56c46f591419d32434265aeb707954b86e4e7c25bf8274be0f12de')
sha256sums_aarch64=('59f3f87f717718ddb0f1b938efe422a9ca1771af5c9d1597c4f093287164510c' 'd16e3e25ae341c012e04a3261c55ef959a4ec7a2374518e828652c50d75fc4ba')

package() {
  install -Dm755 "kubecom-launcher-${pkgver}-${CARCH}" "$pkgdir/usr/bin/$_pkgname"
  # The seed: enlaunch's default Seed is /usr/lib/<project>, and its bin/<name>
  # is what the launcher execs while the user's home has no build.
  install -Dm755 "kubecom-${pkgver}-${CARCH}" "$pkgdir/usr/lib/kubecom/bin/kubecom"
}

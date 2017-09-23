# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Christian Rebischke <Chris.Rebischke[at]archlinux[dot]org>

pkgname=flannel
pkgver=0.9.0
pkgrel=1
pkgdesc="Etcd backed network fabric for containers"
depends=('glibc')
makedepends=('go' 'git')
arch=('any')
_flannel_commit='317b7d199e3fe937f04ecb39beed025e47316430' # v0.8.0
_pkg_commit='3ac0863d7acf3bc44daf49afef8919af12f704ef' # v3
_glog_commit='23def4e6c14b4da8ac2ed8007337bc5eb5007998' # HEAD
_godotenv_commit='a79fa1e548e2c689c241d10173efd51e5d689d5b' # v1.2.0
_systemd_commit='d2196463941895ee908e13531a23a39feb9e1243' # v15
source=("flannel.service"
        "git+https://github.com/coreos/flannel#commit=${_flannel_commit}"
        "go-pkg::git+https://github.com/coreos/pkg#commit=${_pkg_commit}"
        "git+https://github.com/golang/glog#commit=${_glog_commit}"
        "git+https://github.com/joho/godotenv#commit=${_godotenv_commit}"
        "git+https://github.com/coreos/go-systemd#commit=${_systemd_commit}")
url="https://github.com/coreos/flannel"
license=("APACHE")
sha512sums=('78d44de0f262606c70b328e5d3f7b8fa1abdf234b51c8ace48b812d8c5b00fd169cfe578f0ce187040720baddc8e281e4bfb5146a38012fe83f8c4478a4977b6'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')



prepare() {
  export GOPATH="${srcdir}"
  export PATH="$PATH:$GOPATH/bin"
  mkdir -p "src/github.com/coreos"
  mkdir -p "src/github.com/golang"
  mkdir -p "src/github.com/joho"

  mv ${pkgname} src/github.com/coreos/
  mv go-pkg        src/github.com/coreos/pkg
  mv go-systemd src/github.com/coreos/
  mv glog       src/github.com/golang/
  mv godotenv   src/github.com/joho/

  cd "src/github.com/coreos/${pkgname}"
  make test
}

build() {
  # https://github.com/coreos/flannel/blob/master/Documentation/building.md
  cd "src/github.com/coreos/${pkgname}"
  CGO_ENABLED=1 make dist/flanneld
}

package() {
    cd "src/github.com/coreos/${pkgname}"

    install -Dm755 dist/flanneld $pkgdir/usr/bin/flanneld
    install -Dm644 $srcdir/flannel.service $pkgdir/usr/lib/systemd/system/flannel.service
}

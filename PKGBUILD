# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=loki-core-git
_pkgname=loki-core
_commit=0a60b69ef
pkgver=8.1.5.0a60b69ef
pkgrel=1
pkgdesc='LOKI (OXEN) core for cryptocurrency based on Monero'
url='https://github.com/oxen-io/loki-core'
arch=('x86_64')
license=('custom')
makedepends=('wget' 'git' 'curl' 'cmake' 'boost' 
			 'openssl' 'zeromq' 'sqlite' 'unbound' 'libsodium' )
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd ${_pkgname}
  git checkout ${_commit}
  git submodule update --init --recursive
  make -j$(nproc)
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

  # install binaries on system
  install -d "${pkgdir}/opt/${_pkgname}"
  cd ${_pkgname}/build/Linux/_HEAD_detached_at_${_commit}_/release/bin
  install -m 755 oxen-blockchain-ancestry "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-blockchain-export "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-blockchain-mark-spent-outputs "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-blockchain-usage "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-gen-trusted-multisig "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-wallet-cli "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-blockchain-depth "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-blockchain-import "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-blockchain-stats "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxend "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-sn-keys "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-wallet-rpc "${pkgdir}/opt/${_pkgname}"

  # links scripts to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-ancestry "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-export "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-mark-spent-outputs "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-usage "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-gen-trusted-multisig "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-wallet-cli "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-depth "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-import "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-stats "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxend "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxend "${pkgdir}/usr/bin/lokid" # remove next release
  ln -s /opt/${_pkgname}/oxen-sn-keys "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-wallet-rpc "${pkgdir}/usr/bin"
}

# Maintainer: cembro <cembro at pm dot me>

pkgname=tkey-ssh-agent2
_pkgname=tillitis-key1-apps
pkgver=0.0.6
pkgrel=1
provides=('tkey-ssh-agent')
pkgdesc="An ssh-agent for the Tillitis TKey with separated signer device code"
arch=('any')
url="https://github.com/tillitis/tillitis-key1-apps"
license=('GPL-2.0-only')
makedepends=('lld' 'go')
install=tkey-ssh-agent.install
source=("https://github.com/tillitis/tillitis-key1-apps/archive/refs/tags/v${pkgver}.tar.gz"
  'signer.patch'
)
sha512sums=('524635270cb8e89a1a542b33899d972c9f3b7699102ebc76251351a973bda7b4e09710fd1d93b4eeaad725b1517b768469b547e8d6ee02ee7e0963f70de77161'
            'c69ac118ff611ad2ac12a4f881f846f6b5d0af32b2fd6b8a5b76dfce44b41e71acd71b1ac352ab31abe34d78578eae36dc3872dd40745a2095ab7ae1ede58ef2')

# minimal compatible signer version
_signer_pkgver=0.0.6
depends=("tillitis-key1-apps-signer>=$_signer_pkgver")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # insert the signer version
  patch cmd/tkey-ssh-agent/signer.go "${srcdir}/signer.patch"
  # remove apps dependency and mentions of apps/signer/app.bin
  sed -i 's|^\(tkey-ssh-agent:\).*|\1|g; /apps\/signer\/app.bin/d' Makefile
  make tkey-ssh-agent
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}


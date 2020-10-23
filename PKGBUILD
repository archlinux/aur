# Maintainer: alex4ip <alex4ip@gmail.com>

pkgname=porter-bin
pkgver=0.29.1
pkgrel=3
epoch=1
pkgdesc='A utility to help make your application + etc (env/tool) as a versioned bundle that you can distribute, and then install with a single command'
arch=(x86_64)
url='https://github.com/deislabs/porter'
license=(MIT)
#depends=('docker')
optdepends=('kubernetes-bin'
            'helm'
            'terraform'
            'azure-cli: Command-line tools for Azure'
            'aws-cli: cli for Amazon Web Services'
            'google-cloud-sdk: gcloud - command-line tools for the Google Cloud Platform')
provides=('porter')
#makedepends=('go')
source=("$pkgname-$pkgver::https://cdn.porter.sh/v${pkgver}/porter-linux-amd64")
sha512sums=('d8c73629cbe3a2021b44c405956aa14d4b6ec5b6132676e1cc3dacb0874697ceae5621356bf5f69e6cbee86cc7814b570e262a2bac2e0ef956316304b0d37ae2')

package() {  
  #mkdir -p "${pkgdir}/opt"
  install -Dm 755 "$srcdir/$pkgname-$pkgver" "${pkgdir}/opt/${pkgname}/porter"

  PORTER_HOME="${pkgdir}"/opt/"${pkgname}"  

  mkdir -p "${pkgdir}/usr/bin"
  ln -nfs /opt/${pkgname}/porter "${pkgdir}"/usr/bin/porter

  # Add command completion
  # install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  # install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  # "$pkgdir/usr/bin/provides" completion bash > "$pkgdir/usr/share/bash-completion/completions/provides"
  # "$pkgdir/usr/bin/provides" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_provides"

# Add mixin

  PKG_PERMALINK=${PKG_PERMALINK:-latest}
  
  cd "${pkgdir}"/opt/"${pkgname}"
  ./porter mixin install exec --version $PKG_PERMALINK
  ./porter mixin install kubernetes
  ./porter mixin install helm --version $PKG_PERMALINK
  ./porter mixin install arm --version $PKG_PERMALINK
  ./porter mixin install terraform
  ./porter mixin install az --version $PKG_PERMALINK
  ./porter mixin install aws --version $PKG_PERMALINK
  ./porter mixin install gcloud --version $PKG_PERMALINK

  ./porter plugin install azure --version $PKG_PERMALINK
}

# vim:set ts=2 sw=2 et:

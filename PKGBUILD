pkgname=graphql-lsp
provides=('graphql-language-service-cli')
pkgver=3.1.3
pkgrel=2
pkgdesc='graphql language server cli'
arch=('x86_64')
url="https://github.com/graphql/graphiql"
makedepends=('npm')
source=("$url/archive/refs/tags/graphql-language-service@$pkgver.tar.gz")
sha256sums=('0cdf7da4e2c161bb5a249748d4e60482453abff4d12f164d1fa3e1b6ab1172a4')

package() {
  package=$(npm pack "${srcdir}/graphiql-graphql-language-service-${pkgver}/packages/graphql-language-service-cli")
  npm install -g --prefix "${pkgdir}/usr" "$package"

#  tar -zcvf "graphql-language-service-cli-$pkgver.tar.gz" .
#  npm install -g --prefix "${pkgdir}/usr" "graphql-language-service-cli-$pkgver.tar.gz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

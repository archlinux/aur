# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=apache-gremlin-console
pkgver=3.3.1
pkgrel=1
pkgdesc="Gremlin console from Apache TinkerPop "
arch=('any')
url="https://tinkerpop.apache.org"
license=('Apache')

depends=('bash' 'java-environment')
makedepends=()
source=(https://www.apache.org/dist/tinkerpop/${pkgver}/apache-tinkerpop-gremlin-console-${pkgver}-bin.zip)
md5sums=('486769d4e8a127b806bb86cceabb861c')
sha256sums=('0412af15fbbd0e75d09de032d7aca42228899c8975883d2b894878648fc63cde')

package() {
  cd apache-tinkerpop-gremlin-console-${pkgver}

  mkdir -p "${pkgdir}/usr/share/${pkgname}/bin"
  cp bin/gremlin.sh "${pkgdir}/usr/share/${pkgname}/bin"
  
  for i in conf data ext lib ; do
    cp -R "$i" "${pkgdir}/usr/share/${pkgname}"
  done

  mkdir -p "${pkgdir}/usr/bin"
  printf "#!/bin/sh\ncd /usr/share/${pkgname}/bin\n./gremlin.sh \"\$@\"" >> "${pkgdir}/usr/bin/gremlin"
  chmod 755 "${pkgdir}/usr/bin/gremlin"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Workaround for the following startup exception:
  # Exception in thread "main" java.io.FileNotFoundException: /usr/share/apache-gremlin-console/bin/../ext/plugins.txt
  #
  # Possible fix: skip the cleanup if the file is not writable:
  # https://github.com/apache/tinkerpop/blob/master/gremlin-console/src/main/groovy/org/apache/tinkerpop/gremlin/console/Console.groovy#L137
  chmod a+w "${pkgdir}/usr/share/${pkgname}/ext/plugins.txt"
}

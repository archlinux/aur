# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=apache-gremlin-console
pkgver=3.2.0
pkgrel=1
pkgdesc="Gremlin console from Apache TinkerPop "
arch=('any')
url="https://tinkerpop.incubator.apache.org"
license=('Apache')

depends=('bash' 'java-environment')
makedepends=()
source=(https://www.apache.org/dist/incubator/tinkerpop/${pkgver}-incubating/apache-gremlin-console-${pkgver}-incubating-bin.zip)
md5sums=('c6e1ad041b09f96f5e3f3e68e8b3c6e8')
sha256sums=('d3d58009557c900b641413eaf1adfc2a8b47d058b981a5d235924a5c9021af90')

package() {
  cd apache-gremlin-console-${pkgver}-incubating

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
  # https://github.com/apache/incubator-tinkerpop/blob/master/gremlin-console/src/main/groovy/org/apache/tinkerpop/gremlin/console/Console.groovy#L137
  chmod a+w "${pkgdir}/usr/share/${pkgname}/ext/plugins.txt"
}

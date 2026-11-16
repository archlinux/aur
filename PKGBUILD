# Maintainer: agony <27015 at riseup dot net>

pkgname=kube-diagrams
pkgver=0.9.0
pkgrel=2
pkgdesc='Kubernetes architecture diagrams from manifests, Helm charts and helmfiles'
arch=('any')
url='https://github.com/philippemerle/KubeDiagrams'
license=('Apache-2.0')
depends=('bash' 'graphviz2drawio' 'python' 'python-diagrams' 'python-pygraphviz' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('helm: helm-diagrams'
            'kubectl: kubectl-diagrams')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ddcc9b40b37715fcc27850c9bb01e7eb93a9c2b158a7cebd3581b4dad9cfba4')

build() {
  cd "KubeDiagrams-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "KubeDiagrams-${pkgver}"
  mkdir -p check
  printf '{apiVersion: v1, kind: Service, metadata: {name: demo}}\n' | bin/kube-diagrams -o check/demo.mermaid - > /dev/null
  [[ "$(grep -o 'label: "[^"]*"' check/demo.mermaid)" == 'label: "demo"' ]]
  printf '{apiVersion: v1, kind: Service, metadata: {name: demo}}\n' | bin/kube-diagrams -o check/demo.drawio - > /dev/null
  [[ "$(grep -o '&gt;demo&lt;' check/demo.drawio)" == '&gt;demo&lt;' ]]
}

package() {
  cd "KubeDiagrams-${pkgver}"
  python -m installer --destdir="${pkgdir}" --prefix=/usr/lib/kube-diagrams dist/*.whl
  # dist-info under /usr/lib/kube-diagrams is on no Python path
  rm -rf "${pkgdir}/usr/lib/kube-diagrams/lib"
  install -d "${pkgdir}/usr/bin"
  for program in kube-diagrams helm-diagrams kubectl-diagrams; do
    ln -s "/usr/lib/kube-diagrams/bin/${program}" "${pkgdir}/usr/bin/${program}"
  done
}

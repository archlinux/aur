# Maintainer: agony <27015 at riseup dot net>

pkgname=kube-diagrams-git
pkgver=r675.70e1dda
pkgrel=2
pkgdesc='Kubernetes architecture diagrams from manifests, Helm charts and helmfiles (git version)'
arch=('any')
url='https://github.com/philippemerle/KubeDiagrams'
license=('Apache-2.0')
depends=('bash' 'graphviz2drawio' 'python' 'python-diagrams' 'python-pygraphviz' 'python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('kube-diagrams')
conflicts=('kube-diagrams')
optdepends=('helm: helm-diagrams'
            'kubectl: kubectl-diagrams')
source=("kube-diagrams::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd kube-diagrams
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  git -C kube-diagrams clean -dfx
}

build() {
  cd kube-diagrams
  python -m build --wheel --no-isolation
}

check() {
  cd kube-diagrams
  mkdir -p check
  printf '{apiVersion: v1, kind: Service, metadata: {name: demo}}\n' | bin/kube-diagrams -o check/demo.mermaid - > /dev/null
  [[ "$(grep -o 'label: "[^"]*"' check/demo.mermaid)" == 'label: "demo"' ]]
  printf '{apiVersion: v1, kind: Service, metadata: {name: demo}}\n' | bin/kube-diagrams -o check/demo.drawio - > /dev/null
  [[ "$(grep -o '&gt;demo&lt;' check/demo.drawio)" == '&gt;demo&lt;' ]]
}

package() {
  cd kube-diagrams
  python -m installer --destdir="${pkgdir}" --prefix=/usr/lib/kube-diagrams dist/*.whl
  # dist-info under /usr/lib/kube-diagrams is on no Python path
  rm -rf "${pkgdir}/usr/lib/kube-diagrams/lib"
  install -d "${pkgdir}/usr/bin"
  for program in kube-diagrams helm-diagrams kubectl-diagrams; do
    ln -s "/usr/lib/kube-diagrams/bin/${program}" "${pkgdir}/usr/bin/${program}"
  done
}

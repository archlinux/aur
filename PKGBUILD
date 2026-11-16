# Maintainer: agony <27015 at riseup dot net>

pkgname=kube-diagrams-git
pkgver=r675.70e1dda
pkgrel=1
pkgdesc='Kubernetes architecture diagrams from manifests, Helm charts and helmfiles (git version)'
arch=('any')
url='https://github.com/philippemerle/KubeDiagrams'
license=('Apache-2.0')
depends=('graphviz' 'python' 'python-puremagic' 'python-pygraphviz' 'python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('kube-diagrams')
conflicts=('kube-diagrams')
optdepends=('helm: helm-diagrams'
            'kubectl: kubectl-diagrams')
source=("kube-diagrams::git+${url}.git"
        'https://files.pythonhosted.org/packages/py3/d/diagrams/diagrams-0.25.1-py3-none-any.whl'
        'https://files.pythonhosted.org/packages/py3/g/graphviz/graphviz-0.20.3-py3-none-any.whl'
        'https://files.pythonhosted.org/packages/py3/g/graphviz2drawio/graphviz2drawio-1.2.0-py3-none-any.whl'
        'https://files.pythonhosted.org/packages/py2.py3/s/svg.path/svg.path-6.3-py2.py3-none-any.whl')
noextract=('diagrams-0.25.1-py3-none-any.whl'
           'graphviz-0.20.3-py3-none-any.whl'
           'graphviz2drawio-1.2.0-py3-none-any.whl'
           'svg.path-6.3-py2.py3-none-any.whl')
sha256sums=('SKIP'
            '90698eaa74c027dfffd8306ba7f08ee543959205024050a6357f34eae9961345'
            '81f848f2904515d8cd359cc611faba817598d2feaac4027b266aa3eda7b3dde5'
            '09e6d2277043c497b64a008286e7948392e5b79d72ffe54219ef8b709592591a'
            '4bd4747679b527f8db9868e1623bee9f416540b658285d903885768d8a427e5a')

pkgver() {
  cd kube-diagrams
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd kube-diagrams
  sed -i 's/command = \["graphviz2drawio", /command = [sys.executable, "-m", "graphviz2drawio", /' bin/kube-diagrams
}

build() {
  cd kube-diagrams
  python -m build --wheel --no-isolation
  rm -rf "${srcdir}/venv"
  python -m venv --system-site-packages --without-pip "${srcdir}/venv"
  "${srcdir}/venv/bin/python" -m installer dist/*.whl "${srcdir}"/*.whl
}

check() {
  cd kube-diagrams
  mkdir -p check
  printf '{apiVersion: v1, kind: Service, metadata: {name: demo}}\n' | "${srcdir}/venv/bin/kube-diagrams" -o check/demo.mermaid - > /dev/null
  [[ "$(grep -o 'label: "[^"]*"' check/demo.mermaid)" == 'label: "demo"' ]]
  printf '{apiVersion: v1, kind: Service, metadata: {name: demo}}\n' | "${srcdir}/venv/bin/kube-diagrams" -o check/demo.drawio - > /dev/null
  [[ "$(grep -o '&gt;demo&lt;' check/demo.drawio)" == '&gt;demo&lt;' ]]
}

package() {
  cd kube-diagrams
  python -m installer --destdir="${pkgdir}" --prefix=/usr/lib/kube-diagrams dist/*.whl "${srcdir}"/*.whl
  find "${pkgdir}/usr/lib/kube-diagrams/bin" -maxdepth 1 -type f -exec sed -i '1s|^#!/usr/s\?bin/python$|#!/usr/lib/kube-diagrams/bin/python|' {} +
  ln -s /usr/bin/python "${pkgdir}/usr/lib/kube-diagrams/bin/python"
  printf 'home = /usr/bin\ninclude-system-site-packages = true\n' > "${pkgdir}/usr/lib/kube-diagrams/pyvenv.cfg"
  install -d "${pkgdir}/usr/bin"
  for program in kube-diagrams helm-diagrams kubectl-diagrams; do
    ln -s "/usr/lib/kube-diagrams/bin/${program}" "${pkgdir}/usr/bin/${program}"
  done
}

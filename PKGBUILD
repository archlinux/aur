# Maintainer: Louis Bettens louis at bettens dot info

# all commands based on https://github.com/SpencerPark/IJava/README.md
# kernel is installed in /usr and renamed from 'java' to 'ijava-git'

pkgname=ijava-git
pkgver=1.0.7
pkgrel=1
pkgdesc='A Java kernel for Jupyter'
url='https://github.com/SpencerPark/IJava'
arch=('any')
license=('MIT')
depends=(
  'jupyter_console'
  'java-environment=11'  # yes, we need the JDK not the JRE at runtime
  )
makedepends=('java-environment=11' 'gradle')

_gitcommit1=93e9e7bf5ac571b50ec60645327d8dd0d1700dd2
_gitcommit2=2b68e1ec48a049ae7f289480c0a088561fe813a0
source=(
  "https://github.com/SpencerPark/IJava/archive/${_gitcommit1}.tar.gz"
  "https://github.com/SpencerPark/jupyter-jvm-basekernel/archive/${_gitcommit2}.tar.gz"
)
sha256sums=(
  c7467c30f6f34ae9b19947e8568052e06adc8c2d3ce66f682944a1e0c3103c59
  e455ec7ee5972ce81245fd07e5e183ce8891c4162c41c6cb7a5ee31357946c26
)

build() {
  # the provided build process installs into the current user's home.
  # solution: fake home
  export HOME="$(pwd)"
  export _JAVA_OPTIONS=-Duser.home="$HOME"  # for some reason Java won't honor $HOME

  (cd jupyter-jvm-basekernel-${_gitcommit2} && gradle publishToMavenLocal)
  (cd IJava-${_gitcommit1} && gradle installKernel)
}

package() {
  # now, package the kernel that "installKernel" wanted to install in ~/.ipython
  local old_location=".ipython/kernels/java"
  local new_location="/usr/share/jupyter/kernels/${pkgname}"
  sed -i "s|$(pwd)/${old_location}|${new_location}|" ${old_location}/kernel.json
  install -Dm 644 ${old_location}/* -t "${pkgdir}/${new_location}"

  install -Dm 644 IJava-${_gitcommit1}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

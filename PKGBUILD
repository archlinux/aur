# Maintainer Yuqing Gu <sffred@qq.com>
pkgname=jupyter-wolframengine_kernel
pkgver=0.9.2
pkgrel=2
pkgdesc="Wolfram Language kernel for Jupyter notebooks"
arch=('any')
url="https://github.com/WolframResearch/WolframLanguageForJupyter"
license=('MIT')
install=jupyter-wolframengine_kernel.install
depends=(jupyter)
# The wolframengine is listed as optional depends, but you must install
# wolframscript in some way to install this package
optdepends=(wolframengine)
source=("git+https://github.com/WolframResearch/WolframLanguageForJupyter.git")
sha256sums=('SKIP')

prepare() {
#  if [ -d ${srcdir}/WolframLanguageForJupyter ]; then
#    msg2 "Repository exists, deleting"
#    rm -rf ${srcdir}/WolframLanguageForJupyter
#  fi
  msg2 "Cloning repository"
#  git clone https://github.com/WolframResearch/WolframLanguageForJupyter.git
}

check() {
  echo "Login to your linux user that is used to activate WE. Username:"
  read name
  if [ -z ${name} ]; then
    echo "Username cannot be empty"
    exit
  fi
  checkw=`su - ${name} -c 'wolframscript -c 1'`
  if [ $checkw -ne 1 ]; then
    echo "No valid wolframscript installation is found"
    exit
  else
    echo "wolframscript activated"
  fi
  echo ${name} > ${srcdir}/username.conf
}

package() {
  msg2 "Copying installer files"
  mkdir ${pkgdir}/opt 
  cp -r ${srcdir}/WolframLanguageForJupyter ${pkgdir}/opt/WolframLanguageForJupyter

  echo "Generating configure"
  mkdir ${pkgdir}/etc
  cp ${srcdir}/username.conf ${pkgdir}/etc/jupyter-wolframengine_kernel.conf
}


# $Id$
# Contributor: Chad Voegele <cavoegele@gmail.com>

pkgname=nand2tetris
pkgver=2.6
pkgrel=2
pkgdesc="Software suite accompanying Nand2Tetris course."
arch=('any')
url="http://www.nand2tetris.org/"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
source=(n2tCPUEmulator.run
        n2tVMEmulator.run
        n2tJackCompiler.run
        n2tHardwareSimulator.run
        n2tAssembler.run
        n2tCPUEmulator.desktop
        n2tVMEmulator.desktop
        n2tHardwareSimulator.desktop
        n2tAssembler.desktop
)
_nand2teris_source="nand2tetris.zip"
_nand2teris_url="https://drive.google.com/file/u/1/d/1KcFPj8KQ_QAHheFmLCqs5iqC_0NCndvs/view?usp=sharing"
sha256sums=('f93e4c08ed6af6a687f8d144598f998a19ac544d9fe6da05c162932d00f6a592'
            'f05fbcd9d86e7151c2e16682792586fd51086fa4864695ff8600256c15eb83d4'
            '838dda39a97694ef1635ebbb0f6aa850623e281f70ef1e699930ee72e4934361'
            '38884a770a7535e35363ffffb8918a13ff83f67281c71e42b488f645608564cc'
            '02c0ae49624ac9cbc22724edbcbe2a27dfa676bc108d5edffcd4fe70ed8e1433'
            '4d7f229975ae964012e61f2f6cd30a0b2f014b7fc81d7bc8b7eed869a1e2313c'
            '22ae5ab8f278d5f1a6084f2a4bf21702795d8e4d2e24dea4fc92dd1c3df8681f'
            '054d1883e9eeaef754d9c4f15868d3722c08672a34a8d7dcdb242620ed22ba51'
            '2cd1b2c93dd68de97b7c3d9504dc850f4b60774065a70aa8496ba82c7889dc89')

prepare() {
  if [[ ! -f "${_nand2teris_source}" ]]
  then
    echo "Please download the nand2tetris source from ${_nand2teris_url} and place in the src directory."
    exit 1
  fi

  echo "f4ea1e104c9296f98d5b3ebd30acc283a876fedcf289f7679ad80885902bebe4  ${_nand2teris_source}" | sha256sum -c --quiet
  if [[ ! $? -eq 0 ]]
  then
    echo "Integrity check failed for ${_nand2teris_source}"
  fi

  unzip ${_nand2teris_source}
}

package() {
  cd ${srcdir}/${pkgname}

  # just install tools directory
  cd tools
  for file in $(find . -type f -name "*.sh"); do
    install -Dm755 $file ${pkgdir}/usr/share/${pkgname}/$file
  done

  for file in $(find bin builtInVMCode builtInChips OS\
                -name "*.jar"\
                -or -name "*.html"\
                -or -name "*.txt"\
                -or -name "*.vm"\
                -or -name "*.gif"\
                -or -name "*.hdl"\
                -or -name "*.class"); do
    install -Dm644 $file ${pkgdir}/usr/share/${pkgname}/$file
  done

  for file in $(find ${srcdir} -name "*.run"); do
    install -Dm755 $file ${pkgdir}/usr/bin/$(basename ${file%.*})
  done

  for file in $(find ${srcdir} -name "*.desktop"); do
    install -Dm644 $file ${pkgdir}/usr/share/applications/$(basename ${file})
  done
}

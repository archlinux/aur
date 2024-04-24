# Contributor: Chad Voegele <cavoegele@gmail.com>
# Contributor: Kushagra J <volodarolathana@tutanota.com>

pkgname=nand2tetris
pkgver=2.7
pkgrel=1
pkgdesc="Software suite accompanying Nand2Tetris course."
arch=('any')
url="http://www.nand2tetris.org/"
license=('GPL')
depends=('java-runtime')
makedepends=('git')
source=('nand2tetris::git+https://github.com/kushagra-xo/nand2tetris.git'
        n2tCPUEmulator.run
        n2tVMEmulator.run
        n2tJackCompiler.run
        n2tHardwareSimulator.run
        n2tAssembler.run
        n2tCPUEmulator.desktop
        n2tVMEmulator.desktop
        n2tHardwareSimulator.desktop
        n2tAssembler.desktop
)
sha256sums=(SKIP
            'f93e4c08ed6af6a687f8d144598f998a19ac544d9fe6da05c162932d00f6a592'
            'f05fbcd9d86e7151c2e16682792586fd51086fa4864695ff8600256c15eb83d4'
            '838dda39a97694ef1635ebbb0f6aa850623e281f70ef1e699930ee72e4934361'
            '38884a770a7535e35363ffffb8918a13ff83f67281c71e42b488f645608564cc'
            '02c0ae49624ac9cbc22724edbcbe2a27dfa676bc108d5edffcd4fe70ed8e1433'
            '4d7f229975ae964012e61f2f6cd30a0b2f014b7fc81d7bc8b7eed869a1e2313c'
            '22ae5ab8f278d5f1a6084f2a4bf21702795d8e4d2e24dea4fc92dd1c3df8681f'
            '054d1883e9eeaef754d9c4f15868d3722c08672a34a8d7dcdb242620ed22ba51'
            '2cd1b2c93dd68de97b7c3d9504dc850f4b60774065a70aa8496ba82c7889dc89')

pkgver() {
    cd "$srcdir/${pkgname%-VCS}"
    latest_tag=$(git describe --tags --abbrev=0)
    echo "${latest_tag}"
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

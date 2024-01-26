# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgbase=phpstorm
pkgname=(phpstorm phpstorm-jre)
pkgver=2023.3.3
pkgrel=1
pkgdesc='Lightweight and Smart PHP IDE'
arch=('x86_64' 'i686')
license=('custom:jetbrains')
url='https://www.jetbrains.com/phpstorm/'
depends=('glib2' 'python')
options=('!strip')
source=("https://download-cf.jetbrains.com/webide/PhpStorm-${pkgver%b*}.tar.gz"
        jetbrains-phpstorm.desktop
        LICENSE)
b2sums=('e52f24fe0df1f99d104a9b0b1a9c24cd5bc8dece7aa8ce62904747e235616c57c12ad20a8a90857138d9b8835eb590a0e8d2a9b3747e7fb53b7f2cf2be6b0124'
        'c6f86b243d1b0b9533a59bda7c9036dee0c53b1076052ed69c651f886f745ae69ef9839ab406016d2bc4acad133e4f2d54ff0855caebe05fee47c00b00041f4e'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package_phpstorm() {
  optdepends=('phpstorm-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if phpstorm-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely'
              'java-openjfx: rendering Markdown files')
  _buildver="$(ls | grep -Eo 'PhpStorm-[[:digit:]]+\.[[:digit:]]{2,5}\.[[:digit:]]+' | sort -r | head -1 | sed 's#PhpStorm-##')"

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/PhpStorm-${_buildver:?_buildver unset}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/${pkgbase}.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -D -m 644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -D -m 644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_phpstorm-jre() {
  pkgdesc='JBR (JetBrains Runtime) for PhpStorm - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'
  _buildver="$(ls | grep -Eo 'PhpStorm-[[:digit:]]+\.[[:digit:]]{2,5}\.[[:digit:]]+' | sort -r | head -1 | sed 's#PhpStorm-##')"

  install -d -m 755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/PhpStorm-${_buildver:?_buildver unset}/jbr "${pkgdir}"/opt/${pkgbase}
}

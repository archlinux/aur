# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=intellij-idea-community-edition-git
pkgver=r273161.a55684844e95
pkgrel=1
pkgdesc='IDE for Java, Groovy and other programming languages with advanced refactoring features'
url='https://www.jetbrains.com/idea/'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('Apache')
conflicts=('intellij-idea-community-edition')
provides=('intellij-idea-community-edition')
backup=('usr/share/idea/bin/idea.vmoptions'
        'usr/share/idea/bin/idea64.vmoptions')
depends=('giflib' 'java-environment=11' 'python' 'sh' 'ttf-font' 'libdbusmenu-glib')
makedepends=('ant' 'git' 'java8-openjfx' 'java-environment=8')
source=("git+https://github.com/JetBrains/intellij-community.git"
        idea-android::"git+https://github.com/JetBrains/android.git"
        idea-adt-tools-base::"git://git.jetbrains.org/idea/adt-tools-base.git"
        idea.desktop
        idea.sh)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'f8aef9c556d14083762b0ec0e78749dbedfb2ddfe97d013e6a34ef57dbd9109032fee6fbb91ac75c46d1403b5494f781a5492398380f4dc1fce7633dd23507b4'
            'bbe3e470b99850809298161cae66d62d7900703b627eb4ad279800980991f3132f1deb87f6ae0ba8ae2d0091d835957a02f9b00c27f22eb5206618fecd8ff20d')

pkgver() {
  cd intellij-community

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd intellij-community

  # build system doesn't like symlinks
  [ -d "android" ] && rm -rf android
  mv "${srcdir}"/idea-android android
  mv "${srcdir}"/idea-adt-tools-base android/tools-base

  sed -E 's/-Xmx[0-9]+m/-XX:-UseGCOverheadLimit/' -i build.xml
}

build() {
  cd intellij-community
  unset _JAVA_OPTIONS
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
  export PATH="${JAVA_HOME}/bin:${PATH}"
  ant -Dintellij.build.target.os=linux build
  tar -xf "out/idea-ce/artifacts/ideaIC-$(cat build.txt)-no-jbr.tar.gz" -C "${srcdir}"
}

package() {
  BUILD_TXT_PATH="${srcdir}/intellij-community/build.txt"
  cd "idea-IC-$(cat ${BUILD_TXT_PATH})"

  # workaround FS#40934
  sed -i 's/lcd/on/' bin/*.vmoptions

  rm -rf bin/fsnotifier-arm lib/libpty/linux/x86

  install -dm 755 "${pkgdir}"/usr/share/{licenses,pixmaps,idea,icons/hicolor/scalable/apps}
  cp -dr --no-preserve='ownership' bin lib plugins redist "${pkgdir}"/usr/share/idea/
  cp -dr --no-preserve='ownership' license "${pkgdir}"/usr/share/licenses/idea
  ln -s /usr/share/idea/bin/idea.png "${pkgdir}"/usr/share/pixmaps/
  ln -s /usr/share/idea/bin/idea.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
  install -Dm 644 ../idea.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 755 ../idea.sh "${pkgdir}"/usr/bin/idea
  install -Dm 644 build.txt -t "${pkgdir}"/usr/share/idea
}

# vim: ts=2 sw=2 et:

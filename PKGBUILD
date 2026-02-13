# Maintainer: Andreas Wendleder <gonsolo@gmail.com>

_bootstrap=1
pkgname=mill
pkgver=1.1.2
pkgrel=2
pkgdesc="Your shiny new Java/Scala build tool"
arch=('any')
url="https://com-lihaoyi.github.io/mill/"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('git')

if [[ "$_bootstrap" -eq 0 ]]; then
  makedepends+=('mill')
fi

source=("$pkgname-$pkgver.tar.gz::https://github.com/com-lihaoyi/mill/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('6bca3c77ad93fb58821bbacf0ddf9bc8b61ecbe4996b4fe5a9c53a51c25a954a32890fd68b15bb3e8ef7d3e35cb78d01f97ce3ebdeded51186492733c8d6c6dc')

build() {
  cd "$pkgname-$pkgver"

  # Version für den Build-Prozess setzen
  echo "$pkgver" > .mill-version

  local _mill_exec
  if [[ "$_bootstrap" -eq 1 ]]; then
    echo "Bootstrapping with bundled script..."
    _mill_exec="./mill"
    chmod +x "$_mill_exec"
  else
    _mill_exec="mill"
  fi

  # Shell-Präfixe entfernen
  sed -i '/object gradle/a \ \ def prependShellScript = ""' libs/init/package.mill
  sed -i '/object hilt/a \ \ def prependShellScript = ""' libs/androidlib/package.mill

  "$_mill_exec" -i dist.assembly
}

package() {
  cd "$pkgname-$pkgver"
  
  # 1. JAR installieren
  install -Dm644 out/dist/assembly.dest/out.jar "$pkgdir"/usr/share/java/mill/mill.jar
  
  # 2. Das originale Skript patchen und als Launcher nutzen
  # Wir ersetzen die Versionserkennung durch unsere fixe Version
  # Und wir biegen den MILL_CLASSPATH auf unsere installierte JAR um
  install -d "$pkgdir"/usr/bin
  sed -e "s|^DEFAULT_MILL_VERSION=.*|DEFAULT_MILL_VERSION=$pkgver|" \
      -e "s|^MILL_VERSION=.*|MILL_VERSION=$pkgver|" \
      -e 's|#\!/usr/bin/env sh|#\!/usr/bin/bash|' \
      mill > "$pkgdir"/usr/bin/mill
  
  # Füge einen Export hinzu, damit er die JAR findet und nicht neu lädt
  sed -i "2i export MILL_CLASSPATH=/usr/share/java/mill/mill.jar" "$pkgdir"/usr/bin/mill
  
  chmod 755 "$pkgdir"/usr/bin/mill

  # 3. Lizenz
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mill/LICENSE
}

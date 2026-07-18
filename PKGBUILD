# Maintainer: EduHoff <ehcs.business@gmail.com>
pkgname=battle-cats-rolls-git
pkgver=r1815.42885cd
pkgrel=2
pkgdesc="Local Battle Cats seed tracking server with high-performance C seeker"
arch=('x86_64')
url="https://gitlab.com/godfat/battle-cats-rolls"
license=("Apache-2.0")
depends=('ruby' 'ruby-stdlib' 'zenity' 'curl')
makedepends=('git')
provides=('battle-cats-rolls-git')
conflicts=('battle-cats-rolls-git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/battle-cats-rolls"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/battle-cats-rolls"

  echo ":: Patching build script to use GCC..."
  sed -i 's/clang/gcc/g' ./Seeker/bin/build-VampireFlower.sh

  echo ":: Compiling VampireFlower C seeker engine using system compiler..."
  ./Seeker/bin/build-VampireFlower.sh

  echo ":: Setting up build bootstrap environment..."
  export GEM_HOME="${srcdir}/gem_bootstrap"
  export PATH="$PATH:$GEM_HOME/bin"

  gem install --no-document --install-dir "$GEM_HOME" bundler dalli lru_redux

  bundle config set --local path "$GEM_HOME"
  bundle install
}

package() {
  cd "${srcdir}/battle-cats-rolls"

  install -d "${pkgdir}/usr/share/webapps/battle-cats-rolls"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"

  echo ":: Copying core files to application directory..."
  cp -r Seeker bin config lib Gemfile config.ru Rakefile build data "${pkgdir}/usr/share/webapps/battle-cats-rolls/"
  cp "${srcdir}/battle-cats-rolls/lib/battle-cats-rolls/asset/image/treasure.png" "${pkgdir}/usr/share/pixmaps/battle-cats-rolls.png"

  [ -d public ] && cp -r public "${pkgdir}/usr/share/webapps/battle-cats-rolls/"

  echo ":: Deploying sandboxed Ruby environment..."
  export GEM_HOME="${pkgdir}/usr/share/webapps/battle-cats-rolls/vendor/bundle"
  export PATH="$PATH:$GEM_HOME/bin"

  gem install --no-document --install-dir "$GEM_HOME" bundler dalli lru_redux

  bundle config set --local path "$GEM_HOME"
  bundle config set --local without 'cache:test'
  bundle install --gemfile="${pkgdir}/usr/share/webapps/battle-cats-rolls/Gemfile"

  find "${pkgdir}/usr/share/webapps/battle-cats-rolls" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/share/webapps/battle-cats-rolls" -type f -exec chmod 644 {} +

  touch "${pkgdir}/usr/share/webapps/battle-cats-rolls/.env"
  chmod 666 "${pkgdir}/usr/share/webapps/battle-cats-rolls/.env"

  if [ -d "${pkgdir}/usr/share/webapps/battle-cats-rolls/vendor/bundle/bin" ]; then
      chmod +x "${pkgdir}/usr/share/webapps/battle-cats-rolls/vendor/bundle/bin/"*
  fi
  chmod +x "${pkgdir}/usr/share/webapps/battle-cats-rolls/bin/server"
  chmod +x "${pkgdir}/usr/share/webapps/battle-cats-rolls/Seeker/Seeker-VampireFlower"

  cat <<'EOF' > "${pkgdir}/usr/bin/battle-cats-rolls-run"
#!/bin/bash

echo "=================================================="
echo "          BATTLE CATS ROLLS LOCAL SERVER          "
echo "=================================================="
echo ""

cd "/usr/share/webapps/battle-cats-rolls" || exit
export GEM_HOME="/usr/share/webapps/battle-cats-rolls/vendor/bundle"
export PATH="$PATH:$GEM_HOME/bin"

LOCAL_IP=$(ip route get 1.1.1.1 2>/dev/null | grep -oP 'src \K\S+')
[ -z "$LOCAL_IP" ] && LOCAL_IP="127.0.0.1"

(
    echo ":: Waiting for local service initialization..."
    until curl -s -o /dev/null -w "%{http_code}" http://localhost:8080 | grep -q "200" 2>/dev/null; do
        sleep 0.5
    done
    echo ":: Server is up and stable! Launching local instance in your browser..."
    xdg-open "http://localhost:8080"
) &

echo ":: Starting application stack..."
echo ":: Local Address:  http://localhost:8080"
echo ":: Network Access: http://${LOCAL_IP}:8080"
echo ":: To stop the server, simply close this terminal window."
echo "--------------------------------------------------"
if ! bundle exec ./bin/server; then
    echo ""
    echo "[-] Server crashed or failed to start."
    echo ":: Press Enter to close this window."
    read -r
fi
EOF
  chmod +x "${pkgdir}/usr/bin/battle-cats-rolls-run"

  cat <<'EOF' > "${pkgdir}/usr/bin/battle-cats-rolls-launcher"
#!/bin/bash

TERMINALS=('kitty' 'alacritty' 'ghostty' 'foot' 'gnome-terminal' 'konsole' 'xfce4-terminal' 'terminator' 'guake' 'yakuake')
FOUND_TERM=""

for term in "${TERMINALS[@]}"; do
    if command -v "$term" &> /dev/null; then
        FOUND_TERM="$term"
        break
    fi
done

if [ -z "$FOUND_TERM" ]; then
    if command -v zenity &> /dev/null; then
        FOUND_TERM=$(zenity --entry --title="Battle Cats Rolls" --text="Nenhum terminal padrão foi detectado.\nPor favor, digite o comando do seu emulador de terminal:")
    fi
    if [ -z "$FOUND_TERM" ]; then
        exit 1
    fi
fi

case "$FOUND_TERM" in
    "kitty" | "foot")
        $FOUND_TERM /usr/bin/battle-cats-rolls-run
        ;;
    "alacritty" | "ghostty" | "terminator" | "guake" | "yakuake")
        $FOUND_TERM -e /usr/bin/battle-cats-rolls-run
        ;;
    "gnome-terminal" | "konsole" | "xfce4-terminal")
        $FOUND_TERM -- /usr/bin/battle-cats-rolls-run
        ;;
    *)
        $FOUND_TERM -e /usr/bin/battle-cats-rolls-run
        ;;
esac
EOF
  chmod +x "${pkgdir}/usr/bin/battle-cats-rolls-launcher"

  cat <<EOF > "${pkgdir}/usr/share/applications/battle-cats-rolls.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Battle Cats Rolls
Comment=Launch the local seed tracking engine inside a terminal window
Exec=/usr/bin/battle-cats-rolls-launcher
Icon=battle-cats-rolls
Terminal=false
Categories=Game;Utility;
StartupNotify=true
EOF
}

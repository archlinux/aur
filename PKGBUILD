# Maintainer: EduHoff <ehcs.business@gmail.com>
pkgname=battle-cats-rolls-git
pkgver=r1783.7aef471
pkgrel=1
pkgdesc="Local Battle Cats seed tracking server with high-performance C seeker"
arch=('x86_64')
url="https://gitlab.com/godfat/battle-cats-rolls-git"
license=("Apache-2.0")
depends=('ruby' 'memcached' 'clang' 'zenity' 'curl')
makedepends=('git')
provides=('battle-cats-rolls-git')
conflicts=('battle-cats-rolls-git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/battle-cats-rolls-git"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/battle-cats-rolls-git"
  echo ":: Compiling VampireFlower C seeker engine..."
  ./Seeker/bin/build-VampireFlower.sh

  echo ":: Extracting and building game data tables (build/*.yaml)..."
  export GEM_HOME="${srcdir}/gem_bootstrap"
  export PATH="$PATH:$GEM_HOME/bin"

  gem install --no-document --install-dir "$GEM_HOME" bundler rake erb dalli

  echo "gem 'erb'" >> Gemfile

  bundle config set --local path "$GEM_HOME"
  bundle install

  rake build
}

package() {
  cd "${srcdir}/battle-cats-rolls-git"

  install -d "${pkgdir}/usr/share/webapps/battle-cats-rolls-git"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"

  echo ":: Copying core files to application directory..."
  cp -r Seeker bin config lib Gemfile config.ru Rakefile build data "${pkgdir}/usr/share/webapps/battle-cats-rolls-git/"
  cp "${srcdir}/battle-cats-rolls-git/lib/battle-cats-rolls-git/asset/image/treasure.png" "${pkgdir}/usr/share/pixmaps/battle-cats-rolls-git.png"

  [ -d public ] && cp -r public "${pkgdir}/usr/share/webapps/battle-cats-rolls-git/"

  touch "${pkgdir}/usr/share/webapps/battle-cats-rolls-git/.env"

  echo ":: Deploying sandboxed Ruby environment..."
  export GEM_HOME="${pkgdir}/usr/share/webapps/battle-cats-rolls-git/vendor/bundle"
  export PATH="$PATH:$GEM_HOME/bin"

  gem install --no-document --install-dir "$GEM_HOME" bundler erb dalli

  bundle config set --local path "$GEM_HOME"
  bundle config set --local without 'cache:test'
  bundle install --gemfile="${pkgdir}/usr/share/webapps/battle-cats-rolls-git/Gemfile"

  find "${pkgdir}/usr/share/webapps/battle-cats-rolls-git" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/share/webapps/battle-cats-rolls-git" -type f -exec chmod 644 {} +

  if [ -d "${pkgdir}/usr/share/webapps/battle-cats-rolls-git/vendor/bundle/bin" ]; then
      chmod +x "${pkgdir}/usr/share/webapps/battle-cats-rolls-git/vendor/bundle/bin/"*
  fi
  chmod +x "${pkgdir}/usr/share/webapps/battle-cats-rolls-git/bin/server"
  chmod +x "${pkgdir}/usr/share/webapps/battle-cats-rolls-git/Seeker/Seeker-VampireFlower"

  cat <<'EOF' > "${pkgdir}/usr/bin/battle-cats-rolls-git-run"
#!/bin/bash

echo "=================================================="
echo "          BATTLE CATS ROLLS LOCAL SERVER          "
echo "=================================================="
echo ""

if ! systemctl is-active --quiet memcached; then
    echo ":: memcached is required for caching database records."
    echo ":: Please enter your password to start the service:"
    if ! sudo systemctl start memcached; then
        echo "[-] Failed to start memcached. Press Enter to exit."
        read -r
        exit 1
    fi
    echo ""
fi

cd "/usr/share/webapps/battle-cats-rolls-git" || exit
export GEM_HOME="/usr/share/webapps/battle-cats-rolls-git/vendor/bundle"
export PATH="$PATH:$GEM_HOME/bin"

LOCAL_IP=$(ip route get 1.1.1.1 2>/dev/null | grep -oP 'src \K\S+')
[ -z "$LOCAL_IP" ] && LOCAL_IP="127.0.0.1"

# Monitor ativo em background aguardando o warmup estável do yahns
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
  chmod +x "${pkgdir}/usr/bin/battle-cats-rolls-git-run"

  cat <<'EOF' > "${pkgdir}/usr/bin/battle-cats-rolls-git-launcher"
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
        $FOUND_TERM /usr/bin/battle-cats-rolls-git-run
        ;;
    "alacritty" | "ghostty" | "terminator" | "guake" | "yakuake")
        $FOUND_TERM -e /usr/bin/battle-cats-rolls-git-run
        ;;
    "gnome-terminal" | "konsole" | "xfce4-terminal")
        $FOUND_TERM -- /usr/bin/battle-cats-rolls-git-run
        ;;
    *)
        $FOUND_TERM -e /usr/bin/battle-cats-rolls-git-run
        ;;
esac
EOF
  chmod +x "${pkgdir}/usr/bin/battle-cats-rolls-git-launcher"

  cat <<EOF > "${pkgdir}/usr/share/applications/battle-cats-rolls-git.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Battle Cats Rolls
Comment=Launch the local seed tracking engine inside a terminal window
Exec=/usr/bin/battle-cats-rolls-git-launcher
Icon=battle-cats-rolls-git
Terminal=false
Categories=Game;Utility;
StartupNotify=true
EOF
}

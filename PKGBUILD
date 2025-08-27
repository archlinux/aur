# Maintainer: Jonas Alves(JonasAlv) <zeropior@proton.me>
pkgname=turtle-wow
pkgver=2.1.2
pkgrel=19
pkgdesc="Turtle WoW game launcher (extracted AppImage)"
arch=('x86_64')
url="https://turtle-wow.org/"
license=('custom')
provides=('turtle-wow')
conflicts=('turtle-wow')
# jq is required to manipulate preferences.json.
depends=('gtk3' 'alsa-lib' 'jq' 'webkit2gtk-4.1' ) 
install=turtle-wow.install
options=('!strip')

# Using a direct CDN link for stability.
_hash=9BEF2C29BE14CF2C26030B086DFC854DB56096DDEAABE31D33BFC6B131EC5529
source=("${pkgname}-${pkgver}.AppImage::https://turtle-eu.b-cdn.net/client/${_hash}/TurtleWoW.AppImage"
        "turtle-wow.install") 
# Checksums are skipped cuz am lazy *_*
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir"
  chmod +x "${pkgname}-${pkgver}.AppImage"
  # extract AppImage
  ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
  
  cd squashfs-root/
  # delete bundled libraries
  rm -rfv usr/lib/*
  chmod u+x AppRun
}


package() {
  cd "$srcdir/squashfs-root"

  # Install the application to /opt
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r ./* "${pkgdir}/opt/${pkgname}/"

  # execution permissions needed(AppRun and AppRun.wrapped)
  chmod +x "${pkgdir}/opt/${pkgname}/AppRun"
  chmod +x "${pkgdir}/opt/${pkgname}/AppRun.wrapped"

  #script in /usr/bin for system-wide access
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/turtle-wow" <<'EOL'
#!/bin/sh
# Wrapper script for the Turtle WoW launcher.

PREFS_FILE="$HOME/.local/share/turtle-wow/preferences.json"
GAME_DIR="$HOME/Games/turtle-wow/"
APP_EXEC="/opt/turtle-wow/AppRun"

# Function to run the application with the correct working library path.
run_app() {
    # during testing i found out that this is needed, to cd into the GAME_DIR
    # so app will run as if inside the GAME_DIR and will set the directory correctly
    if [ -d "$GAME_DIR" ]; then
        cd "$GAME_DIR"
    fi
    LD_LIBRARY_PATH=/usr/lib "$APP_EXEC" "$@"
}

# Condition to check if the config file is fully formed.
is_config_complete() {
    if [ -f "$PREFS_FILE" ] && jq -e '.mirror and .launcherVersion' "$PREFS_FILE" >/dev/null 2>&1; then
        return 0 # Success
    else
        return 1 # Failure
    fi
}

# If Success
if is_config_complete; then
    # Update the client directory just in case it was changed, then run
    jq --arg path "$GAME_DIR" '.clientDir = $path' "$PREFS_FILE" > "${PREFS_FILE}.tmp" && mv "${PREFS_FILE}.tmp" "$PREFS_FILE"
    run_app
else
    # This is the first launch or the config is incomplete.
    run_app &
    APP_PID=$!

    #wait for the app to create the config file
    for i in $(seq 1 30); do
        if is_config_complete; then
            
            kill $APP_PID
            wait $APP_PID 2>/dev/null

            #set GAME_DIR
            jq --arg path "$GAME_DIR" '.clientDir = $path' "$PREFS_FILE" > "${PREFS_FILE}.tmp" && mv "${PREFS_FILE}.tmp" "$PREFS_FILE"

            # relaunch the application
            run_app
            exit 0
        fi
        sleep 1
    done
    exit 1
fi
EOL
  chmod +x "${pkgdir}/usr/bin/turtle-wow"

  # Create a .desktop for aplications launchers
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/turtle-wow.desktop" <<'EOL'
[Desktop Entry]
Name=Turtle WoW
Comment=The Turtle WoW game launcher
Exec=turtle-wow
Icon=turtle-wow
Terminal=false
Type=Application
Categories=Game;
EOL

  # Install the application icon
  install -Dm644 turtle-wow.png "${pkgdir}/usr/share/pixmaps/turtle-wow.png"
}

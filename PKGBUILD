# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=gdlauncher-git
pkgver=1.0.0.beta.1.r0.ge7354f30
pkgrel=2
pkgdesc='Modded Minecraft launcher built with Electron/React (legacy git version)'
arch=('x86_64')
url='https://gdevs.io'
license=('MIT')
provides=('gdlauncher')
conflicts=('gdlauncher' 'gdlauncher-appimage')
depends=('electron' 'libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3')
makedepends=('git' 'yarn' 'node-gyp')
source=('git+https://github.com/gorilla-devs/GDLauncher.git#branch=GDLauncher_old')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/GDLauncher"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/GDLauncher"

  # disable updater
  sed -i package.json -e '/electron-updater/d'
  patch app/main.dev.js <<'EOF'
@@ -14,7 +14,6 @@ import { app, BrowserWindow, ipcMain } from 'electron';
 import minimist from 'minimist';
 import log from 'electron-log';
 import DiscordRPC from 'discord-rpc';
-import { autoUpdater } from 'electron-updater';
 import store from './localStore';
 import { THEMES } from './constants';
 import MenuBuilder from './menu';
@@ -152,20 +151,6 @@ if (minimist(process.argv.slice(1)).i) {
       });
       rpc.login({ clientId }).catch(log.error);

-      autoUpdater.logger = log;
-      autoUpdater.autoDownload = false;
-
-      const channel =
-        store.get('settings') &&
-          (store.get('settings').releaseChannel === 'latest' ||
-            store.get('settings').releaseChannel === 'beta')
-          ? store.get('settings').releaseChannel
-          : 'latest';
-
-      autoUpdater.channel = channel;
-
-      autoUpdater.allowPrerelease = channel === 'beta';
-
       // Same as for console transport
       log.transports.file.level = 'silly';
       log.transports.file.format = '{h}:{i}:{s}:{ms} {text}';
@@ -184,41 +169,6 @@ if (minimist(process.argv.slice(1)).i) {
     });
     let checked = false;

-    ipcMain.on('check-for-updates', ev => {
-      // Avoid doing this more than 1 time. It breaks everything
-      if (checked === true) return;
-      autoUpdater.checkForUpdates();
-      checked = true;
-      log.info('CHECK_FOR_UPDATES');
-
-      autoUpdater.on('update-available', info => {
-        log.info('DOWNLOAD_AVAILABLE');
-        ev.sender.send('update-available');
-      });
-
-      autoUpdater.on('update-downloaded', info => {
-        log.info('UPDATE_DOWNLOADED');
-        ev.sender.send('update-downloaded');
-      });
-
-      autoUpdater.on('download-progress', data => {
-        log.info(data);
-        ev.sender.send('download-progress', Math.floor(data.percent));
-      });
-    });
-
-    ipcMain.on('download-updates', () => {
-      log.info('DOWNLOAD_UPDATES');
-      autoUpdater.downloadUpdate();
-    });
-
-    ipcMain.on('apply-updates', () => {
-      log.info('APPLY_UPDATES');
-      autoUpdater.quitAndInstall(true, true);
-      // app.relaunch({ args: process.argv.slice(1).concat(['--relaunch']) });
-      // app.exit();
-    });
-
     ipcMain.on('open-devTools', () => {
       mainWindow.webContents.openDevTools({ mode: 'undocked' });
     });
EOF
}

build() {
  cd "$srcdir/GDLauncher"

  # use system node-gyp
  sed -i package.json -e \
    '2i\  "resolutions": {"node-gyp": "file:/usr/lib/node_modules/node-gyp"},'

  yarn --cache-folder="$srcdir/npm-cache"
  yarn build
}

package() {
  cd "${srcdir}/GDLauncher"

  # copy app directory
  mkdir -p "$pkgdir/usr/lib"
  mv app/main.prod.js app/index.js
  rm app/{main.dev.js,main.prod.js.map}
  cp -rp app "$pkgdir/usr/lib/gdlauncher"

  # copy icon
  mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  cp app/assets/images/logo.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/gdlauncher.png"

  # create run script
  mkdir -p "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/gdlauncher" <<'EOF'
#!/bin/sh
exec electron /usr/lib/gdlauncher "$@"
EOF
  chmod a+x "$pkgdir/usr/bin/gdlauncher"

  # create desktop file
  mkdir -p "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/gdlauncher.desktop" <<'EOF'
[Desktop Entry]
Name=GDLauncher
Comment=A Custom Minecraft Launcher
Exec=/usr/bin/gdlauncher %U
Terminal=false
StartupWMClass=GDLauncher
Icon=gdlauncher
Categories=Game;
EOF
}

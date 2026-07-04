# Maintainer: David Kantun <dkantun@gmail.com>

pkgname=libria
pkgver=1.8.1
pkgrel=2
pkgdesc="Application for professional book creation and typesetting — book editor and layout tool with real-time preview, EPUB/DOCX/PDF export, and spell checking"
arch=('x86_64')
url="https://github.com/Gargadon/libria"
license=('MIT')
depends=('electron>=32' 'ghostscript')
makedepends=('bun' 'python')
provides=("${pkgname}")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('701e8e08ceba031394a1ee197fabef01168eb452e9537eabf8f8d4064338cc3d')

prepare() {
  cd "${srcdir}/libria-${pkgver}"
  # Replace native dialogs in version check with IPC (prevents segfault/hang on Linux)
  # Also patch preload.js, electron.d.ts, and Angular source
  python3 << 'PATCH_EOF'
import re

# --- main.js ---
with open('main.js', 'r') as f:
    content = f.read()

content = content.replace(
    '''function showLinuxUpdateNotice(latestVersion) {
  dialog.showMessageBox(getDialogParent(), {
    type: 'info',
    title: 'Nueva versión disponible',
    message: `Libria ${latestVersion} está disponible`,
    detail: 'Actualiza desde tu gestor de paquetes o descarga el instalador en:\\ngithub.com/Gargadon/libria/releases',
    buttons: ['Entendido'],
  });
}''',
    '''function showLinuxUpdateNotice(latestVersion) {
  mainWindow?.webContents.send('update:available', latestVersion);
}'''
)

content = content.replace(
    '''        } else if (manual) {
          dialog.showMessageBox(getDialogParent(), {
            type: 'info',
            title: 'Actualizaciones',
            message: 'Estás al día',
            detail: `Libria ${app.getVersion()} es la versión más reciente disponible.`,
            buttons: ['Aceptar'],
          });
        }''',
    '''        } else if (manual) {
          mainWindow?.webContents.send('update:check-result', 'uptodate');
        }'''
)

content = content.replace(
    '''        if (manual) {
          dialog.showMessageBox(getDialogParent(), {
            type: 'error',
            title: 'Actualizaciones',
            message: 'Error al buscar actualizaciones',
            detail: 'No se pudo obtener la última versión desde GitHub.',
            buttons: ['Aceptar'],
          });
        }''',
    '''        if (manual) {
          mainWindow?.webContents.send('update:check-result', 'error');
        }'''
)

content = content.replace(
    '''    if (manual) {
      dialog.showMessageBox(getDialogParent(), {
        type: 'error',
        title: 'Actualizaciones',
        message: 'Error al buscar actualizaciones',
        detail: 'La solicitud tardó demasiado. Verifica tu conexión a internet.',
        buttons: ['Aceptar'],
      });
    }''',
    '''    if (manual) {
      mainWindow?.webContents.send('update:check-result', 'timeout');
    }'''
)

content = content.replace(
    '''    if (manual) {
      dialog.showMessageBox(getDialogParent(), {
        type: 'error',
        title: 'Actualizaciones',
        message: 'Error al buscar actualizaciones',
        detail: err.message,
        buttons: ['Aceptar'],
      });
    }''',
    '''    if (manual) {
      mainWindow?.webContents.send('update:check-result', 'error');
    }'''
)

with open('main.js', 'w') as f:
    f.write(content)

# --- preload.js ---
with open('preload.js', 'r') as f:
    content = f.read()

content = content.replace(
    '  onUpdateAvailable: (callback) => ipcRenderer.on(\'update:available\', (_event, version) => callback(version)),',
    '''  onUpdateAvailable: (callback) => ipcRenderer.on('update:available', (_event, version) => callback(version)),
  onUpdateCheckResult: (callback) => ipcRenderer.on('update:check-result', (_event, result) => callback(result)),'''
)

with open('preload.js', 'w') as f:
    f.write(content)

# --- electron.d.ts ---
with open('src/electron.d.ts', 'r') as f:
    content = f.read()

content = content.replace(
    '  onUpdateAvailable(callback: (version: string) => void): void;',
    '''  onUpdateAvailable(callback: (version: string) => void): void;
  onUpdateCheckResult(callback: (result: string) => void): void;'''
)

with open('src/electron.d.ts', 'w') as f:
    f.write(content)

# --- src/app/app.ts ---
with open('src/app/app.ts', 'r') as f:
    content = f.read()

content = content.replace(
    "  showAbout = signal(false);\n  updateVersion = signal('');",
    "  showAbout = signal(false);\n  updateVersion = signal('');\n  checkResult = signal('');"
)

content = content.replace(
    '''    if (api?.onUpdateAvailable) {
      api.onUpdateAvailable((version: string) => {
        this.ngZone.run(() => {
          this.updateVersion.set(version);
        });
      });
    }''',
    '''    if (api?.onUpdateAvailable) {
      api.onUpdateAvailable((version: string) => {
        this.ngZone.run(() => {
          this.updateVersion.set(version);
        });
      });
    }
    if (api?.onUpdateCheckResult) {
      api.onUpdateCheckResult((result: string) => {
        this.ngZone.run(() => {
          const messages: Record<string, string> = {
            uptodate: 'Ya tienes la versi\u00f3n m\u00e1s reciente.',
            error: 'Error al buscar actualizaciones.',
            timeout: 'La solicitud tard\u00f3 demasiado. Verifica tu conexi\u00f3n.',
          };
          this.checkResult.set(messages[result] || '');
          setTimeout(() => this.checkResult.set(''), 4000);
        });
      });
    }'''
)

with open('src/app/app.ts', 'w') as f:
    f.write(content)

# --- src/app/app.html ---
with open('src/app/app.html', 'r') as f:
    content = f.read()

content = content.replace(
    '''  <!-- Subtle saving indicator -->
  <div class="subtle-loader" [class.subtle-loader--on]="store.isSaving()">
    <div class="subtle-loader__bar"></div>
  </div>
</div>''',
    '''  <!-- Update notification banner -->
  @if (updateVersion()) {
    <div class="update-banner">
      <span>Libria {{ updateVersion() }} est\u00e1 disponible.</span>
      <button class="update-banner__close" (click)="updateVersion.set('')">
        <span class="material-symbols-outlined">close</span>
      </button>
    </div>
  }

  @if (checkResult()) {
    <div class="check-result">{{ checkResult() }}</div>
  }

  <!-- Subtle saving indicator -->
  <div class="subtle-loader" [class.subtle-loader--on]="store.isSaving()">
    <div class="subtle-loader__bar"></div>
  </div>
</div>'''
)

with open('src/app/app.html', 'w') as f:
    f.write(content)

# --- src/styles.scss ---
with open('src/styles.scss', 'r') as f:
    content = f.read()

content += '''

/* ===== Update banner ===== */
.update-banner {
  position: fixed;
  bottom: 16px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 10px 18px;
  background: var(--paper);
  border: 1px solid var(--rule);
  border-radius: 10px;
  box-shadow: var(--shadow-lg);
  font-size: 13px;
  color: var(--ink);
  z-index: 9000;
}

.update-banner__close {
  background: none;
  border: none;
  color: var(--ink-soft);
  cursor: pointer;
  padding: 2px;
  display: flex;
  border-radius: 4px;
}

.update-banner__close:hover {
  color: var(--ink);
  background: var(--paper-2);
}

.update-banner__close .material-symbols-outlined {
  font-size: 18px;
}

/* ===== Check result toast ===== */
.check-result {
  position: fixed;
  bottom: 16px;
  left: 50%;
  transform: translateX(-50%);
  padding: 8px 16px;
  background: var(--paper-2);
  border: 1px solid var(--rule);
  border-radius: 8px;
  font-size: 12px;
  color: var(--ink-soft);
  z-index: 9000;
  animation: check-fade 4s ease forwards;
}

@keyframes check-fade {
  0%, 70% { opacity: 1; }
  100% { opacity: 0; transform: translateX(-50%) translateY(-8px); }
}
'''

with open('src/styles.scss', 'w') as f:
    f.write(content)

PATCH_EOF

  bun install
}

build() {
  cd "${srcdir}/libria-${pkgver}"
  bun run build
}

package() {
  cd "${srcdir}/libria-${pkgver}"

  # Aplicación
  local _dest="${pkgdir}/opt/libria"
  install -dm755 "${_dest}/dist/libria"
  cp -r dist/libria/browser/. "${_dest}/dist/libria/browser/"
  cp main.js preload.js package.json "${_dest}/"
  cp -r build/licenses "${_dest}/licenses"
  install -Dm644 build/icon.png "${_dest}/build/icon.png"

  # Script de lanzamiento
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/libria" << 'SCRIPT'
#!/bin/bash
export GDK_BACKEND=x11
export ELECTRON_OZONE_PLATFORM_HINT=x11
exec /usr/bin/electron --ozone-platform=x11 /opt/libria/main.js "$@"
SCRIPT
  chmod 755 "${pkgdir}/usr/bin/libria"

  # Desktop entry
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/libria.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Libria
Comment=Professional book editor and typesetter
Exec=/usr/bin/libria %F
Icon=libria
Terminal=false
Type=Application
MimeType=application/x-libria;
Categories=Office;WordProcessor;Development;
StartupWMClass=Libria
DESKTOP

  # Icono
  install -Dm644 build/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/libria.png"

  # Asociación de archivos .libria
  install -dm755 "${pkgdir}/usr/share/mime/packages"
  cat > "${pkgdir}/usr/share/mime/packages/libria.xml" << 'MIME'
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-libria">
    <comment>Libria Document</comment>
    <glob pattern="*.libria"/>
    <icon name="libria"/>
  </mime-type>
</mime-info>
MIME

  # Licencias
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/libria/LICENSE"
}

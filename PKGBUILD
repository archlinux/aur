# Maintainer: Juliano Paiva Junho <jjunho at gmail dot com>
# SPDX-License-Identifier: 0BSD
pkgname=visual-studio-code-autoupdate
pkgver=1.0
pkgrel=5
pkgdesc='Microsoft Visual Studio Code with automatic twice-daily updates'
arch=('x86_64')
url='https://github.com/jjunho/visual-studio-code-autoupdate'
license=('0BSD' 'LicenseRef-Microsoft')
depends=('python>=3.12' 'systemd' 'ca-certificates' 'bash' 'coreutils' 'util-linux' 'shadow'
         'libxkbfile' 'gnupg' 'gtk3' 'libsecret' 'nss' 'gcc-libs'
         'libnotify' 'libxss' 'glibc' 'lsof' 'shared-mime-info' 'xdg-utils' 'alsa-lib')
optdepends=('glib2: move files to trash'
            'libdbusmenu-glib: KDE global menu'
            'org.freedesktop.secrets: settings sync'
            'bubblewrap: agent host sandboxing'
            'socat: agent host sandboxing')
provides=('code' 'vscode')
conflicts=('code' 'visual-studio-code-bin')
options=('!strip')
install=visual-studio-code-autoupdate.install
source=('vscode-update'
        'code'
        'vscode-update.service'
        'vscode-update.timer'
        'com.microsoft.VSCode.desktop'
        'com.microsoft.VSCode.UrlHandler.desktop'
        'code-workspace.xml'
        'visual-studio-code-autoupdate.install'
        'README.md'
        'LICENSE'
        'test_vscode_update.py'
        'test_code_setup.py'
        'vscode-update.sysusers'
        'vscode-update.tmpfiles')
sha256sums=('499c5bef6e5e2b5750105ed8b662c398923124d4277f33549f714aa47af67ad3'
            '73dd0a026b3fce68c621d34242ee7763c637c87493f235aade639641cab25e1f'
            '0f7c1ac0b96159d837f4ea49e99574987308f3779bdf39538ebc662aa3cc8165'
            'b78b77f72580b2fa0a10e693267c5b0400ce935e3fbb99f8aeb2424d9cc42ec6'
            'a84273a40dd5dfc0b9064b46a464957fbce02cf9feb46731cd01ab7e51508341'
            '180e06b990323feb014224bcfb570e3091e4fcaa06c9618345c74b5e583febdb'
            'a06f8d3e435e40fe1ae4ac3782edb782ffb51993d73b612ed9cd2054d1a0e57f'
            'b0ce17e2b01922111bee95175cd6381fa988b7d1bb78d8492e1ebf7ee8120e3e'
            '239245a4b8f84e1d3bce573838fbbcf0fee5d227f8d60cba431de8ff932200d6'
            '6668196519d52d349278e9b272ec3751aeb50d29a688a0eec45b3caae11b7159'
            '7d31dd06af62d95d9b40302c1e3bbdb0f2fe2a126cfee0f1f2d636d0ec63abdb'
            '87fda4db99bbaddb572dc0b5214a99f1b423a34d3e05af925f93a19fd56b7fbb'
            '38e22b99526bed1245241187c273d318e6cc704440d5c94dd973b5059c6d7d8a'
            'c5d4035169cf61506fd5bfb050ea0a4f7e05840700c952e34e1c81169b735c9f')

prepare() {
  # Fetch latest metadata on every build, not a cached "latest" archive.
  python -B - <<'PY'
from pathlib import Path
import runpy

root = Path('editor').resolve()
root.mkdir(exist_ok=True)
runpy.run_path('vscode-update')['update'](root)
PY
}

check() {
  python -B -m unittest discover -p 'test_*.py'
}

package() {
  local release
  release=$(readlink editor/current)
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -a "editor/$release" "$pkgdir/usr/lib/$pkgname/$release"
  ln -s "$release" "$pkgdir/usr/lib/$pkgname/bundled"
  install -Dm644 editor/current/resources/app/resources/linux/code.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/visual-studio-code.png"
  install -Dm644 editor/current/resources/app/LICENSE.rtf \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rtf"
  install -Dm755 vscode-update "$pkgdir/usr/lib/$pkgname/vscode-update"
  install -Dm755 code "$pkgdir/usr/bin/code"
  install -Dm644 vscode-update.service "$pkgdir/usr/lib/systemd/system/vscode-update.service"
  install -Dm644 vscode-update.timer "$pkgdir/usr/lib/systemd/system/vscode-update.timer"
  install -Dm644 vscode-update.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 vscode-update.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 com.microsoft.VSCode.desktop \
    "$pkgdir/usr/share/applications/com.microsoft.VSCode.desktop"
  install -Dm644 com.microsoft.VSCode.UrlHandler.desktop \
    "$pkgdir/usr/share/applications/com.microsoft.VSCode.UrlHandler.desktop"
  install -Dm644 code-workspace.xml "$pkgdir/usr/share/mime/packages/code-workspace.xml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

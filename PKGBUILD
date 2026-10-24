# Maintainer: gaou-piou <i.am.piou@gmail.com>

pkgname=codemeyo-bin
pkgver=1.11.7
pkgrel=2
pkgdesc='Multi-LLM autonomous coding agent with Claude, GPT, Grok, Gemini, DeepSeek, Mistral, Ollama and Groq support'
arch=('x86_64')
url='https://codemeyo.com'
license=('MIT')
depends=('fuse2')
provides=('codemeyo')
conflicts=('codemeyo')
options=('!strip' '!debug')

# Upstream gates the Linux installer behind an e-mail form at
# https://codemeyo.com/download/linux, so no versioned download URL exists.
# The desktop updater serves the exact same artifact from a public file id;
# this package tracks that endpoint.
#
# To update, download the latest Linux AppImage from the form, then locate the
# matching public id at https://codemeyo.com/api/v1/updater/files/<id> (its
# Content-Disposition header carries the file name). Bump pkgver, _fileid and
# the checksums.
_fileid=62

# codemeyo.com is fronted by a firewall that answers HTTP 403 to curl's stock
# User-Agent ("curl/8.x") on a cold connection; any browser-like UA passes and
# then leaves that IP trusted for a short while. makepkg's default https agent
# sends the stock UA, which is why a plain `makepkg` dies here. Override it for
# this package's sources only. DLAGENTS entries are word-split, so the UA is
# deliberately space-free ("Mozilla/5.0", never "Mozilla/5.0 (X11; ...)").
DLAGENTS=('http::/usr/bin/curl -fLC - -A Mozilla/5.0 --retry 5 --retry-delay 10 --retry-all-errors --retry-max-time 900 -o %o %u'
          'https::/usr/bin/curl -fLC - -A Mozilla/5.0 --retry 5 --retry-delay 10 --retry-all-errors --retry-max-time 900 -o %o %u')

source=("CodeMeYo_${pkgver}_amd64.AppImage::https://codemeyo.com/api/v1/updater/files/${_fileid}"
        'codemeyo.desktop'
        'codemeyo.png')
sha256sums=('6adbbcc0786f4c638ea0f16e6b3bf80722309c1390d0f96f58aa27e8063da878'
            '322b6c50a4e434e57cd88498159573981321c3187039e7dbaf94d6485718d61c'
            '6c7660390d65217fe8de0892862254f47aee77e0af7096c75b8bfe168c5403f7')

package() {
  install -Dm755 "${srcdir}/CodeMeYo_${pkgver}_amd64.AppImage" \
    "${pkgdir}/opt/codemeyo/CodeMeYo.AppImage"

  # The AppImage carries its own libwayland-client.so.0 and libwayland-egl.so.1,
  # built against an older libwayland than the one in an up-to-date Arch
  # install. When the bundled copy is picked up, WebKitGTK's web process aborts
  # before it can render anything:
  #
  #   Could not create default EGL display: EGL_BAD_PARAMETER. Aborting...
  #
  # and the window stays empty/grey (the app itself keeps running, so nothing
  # looks crashed). Preloading the distro copy makes the loader satisfy the
  # NEEDED entry from /usr/lib instead of the bundle and the UI renders fine.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/codemeyo" <<'EOF'
#!/bin/sh
# Work around the bundled libwayland breaking EGL/WebKit (see PKGBUILD comment).
if [ -r /usr/lib/libwayland-client.so.0 ]; then
  LD_PRELOAD="/usr/lib/libwayland-client.so.0${LD_PRELOAD:+:$LD_PRELOAD}"
  export LD_PRELOAD
fi
exec /opt/codemeyo/CodeMeYo.AppImage "$@"
EOF

  install -Dm644 "${srcdir}/codemeyo.desktop" \
    "${pkgdir}/usr/share/applications/codemeyo.desktop"
  install -Dm644 "${srcdir}/codemeyo.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/codemeyo.png"
}

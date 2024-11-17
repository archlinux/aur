# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
makedepends=('curl' 'jq')
options=('!strip' '!emptydirs')
package() {
  GITHUB_TOKEN="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"
  cd "$srcdir"

  # Get all releases with GitHub API
  curl -s https://api.github.com/repos/LiRenTech/project-graph/releases -H "Authorization: token $GITHUB_TOKEN" | jq -r '.[].tag_name' | while read tag; do
    # If tag == "nightly", get all assets
    if [[ $tag == "nightly" ]]; then
      curl -s https://api.github.com/repos/LiRenTech/project-graph/releases/tags/$tag -H "Authorization: token $GITHUB_TOKEN" | jq -r '.assets[].browser_download_url' | while read url; do
        # If asset name ends with .deb, download it to ${pkgdir} with curl
        if [[ $url == *".deb" ]]; then
          echo "Find artifact: $url"
          echo "Downloading it to ${pkgdir}/app.deb"
          curl -L -o app.deb -H "Authorization: token $GITHUB_TOKEN" $url
        fi
      done
    fi
  done

  # Install deb package
  dpkg-deb -x *.deb here
  cd here

  install -Dm755 usr/bin/project-graph "$pkgdir"/usr/bin/project-graph

  # Install desktop file
  install -Dm644 usr/share/applications/Project\ Graph.desktop "$pkgdir"/usr/share/applications/project-graph.desktop

  # Install icons
  install -Dm644 usr/share/icons/hicolor/128x128/apps/project-graph.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/project-graph.png
  install -Dm644 usr/share/icons/hicolor/256x256@2/apps/project-graph.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/project-graph.png
  install -Dm644 usr/share/icons/hicolor/32x32/apps/project-graph.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/project-graph.png
}
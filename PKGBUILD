# Maintainer: Chakib Benziane (blob42) <contac+aurt@blob42.xyz>
# Contributor:
pkgname=gosuki-git
_pkgname=${pkgname%-git}
pkgver=v1.4.1.r11.g553ef66
pkgrel=1
pkgdesc="A lightweight, open-source, privacy-first bookmark manager that unifies your bookmarks across multiple browsers, syncs them in real time (locally or P2P), requires no extensions, and stores everything locally."
arch=('x86_64' 'i686' 'aarch64')
depends=('glibc')
makedepends=('git' 'go' 'sqlite' 'gcc')
url='https://github.com/blob42/gosuki'
license=(AGPL3)
sha256sums=(SKIP)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed "s+-+.r+" | tr - .

}

build() {
  cd "$_pkgname" || exit

  msg2 'Building...'
  for _pkg in gosuki suki; do
    msg2 $_pkg
    go build \
      -trimpath \
      -mod=readonly \
      -modcacherw \
      -ldflags " -s -w -buildid= -X github.com/blob42/gosuki/pkg/build.Describe=$pkgver" \
      -tags "release systray" \
      -o build/$_pkg \
      ./cmd/$_pkg
  done


  msg2 'Generating shell completions...'
  for shell in bash zsh fish; do
    go run -tags ci ./cmd/gosuki -S completion $shell > contrib/gosuki-$shell.completions
    go run -tags ci ./cmd/suki -S completion $shell > contrib/suki-$shell.completions
  done
}

package() {
  cd ${_pkgname}


  install -Dm 755 build/gosuki -t "$pkgdir"/usr/bin
  install -Dm 755 build/suki -t "$pkgdir"/usr/bin

  install -Dm 644 contrib/linux/etc/systemd/user/${_pkgname}.service \
    "$pkgdir/usr/lib/systemd/user/${_pkgname}.service"


  # Completions
  for completion_file in contrib/*-*.completions; do
      # Skip if no files match the pattern
      [[ -e "$completion_file" ]] || continue

      # Extract the completion type (e.g., fish, bash, zsh) from filename
      basename=$(basename "$completion_file")
      basename=${basename%.completions}
      type=${basename#*-}
      bin=${basename%-*}

      case "$type" in
          fish)
              install -Dm 644 "$completion_file" "${pkgdir}/usr/share/fish/completions/${bin}.fish"
              ;;
          bash)
              install -Dm 644 "$completion_file" "${pkgdir}/usr/share/bash-completion/completions/${bin}"
              ;;
          zsh)
              install -Dm 644 "$completion_file" "${pkgdir}/usr/share/zsh/site-functions/_${bin}"
              ;;
          *)
              exit 1
              echo "Unsupported completion type: $type"
              ;;
      esac
  done


  # documentation
  for _doc in README.md; do
    install -Dm 644 $_doc -t "$pkgdir"/usr/share/doc/"${_pkgname}"
  done

  install -Dm 755 contrib/rofi.sh "${pkgdir}/usr/share/${_pkgname}/scripts/rofi-suki.sh"


  # marktab
  install -Dm 644 contrib/marktab/example.marktab "${pkgdir}/usr/share/doc/${_pkgname}/example.marktab"

  for mt_script in $(find contrib/marktab/scripts -type f -print); do
    msg2 $mt_script
    install -Dm 755 $mt_script "${pkgdir}/usr/share/${_pkgname}/scripts/marktab/$(basename $mt_script)"
  done

  install -Dm 644 contrib/${_pkgname}.1 \
    "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  install -Dm 644 contrib/suki.1 -t \
    "${pkgdir}/usr/share/man/man1/"


  # cleaning up pkgdir"
  find "$pkgdir" -type d -name .git -exec rm -r '{}' + 2>/dev/null || true
}

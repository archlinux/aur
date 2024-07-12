default:
  just -l

build: clean remove-pkgsum
  makepkg

clean:
  rm -rf pkg src kickoff-*.zst kickoff-*.tar.gz

remove-pkgsum:
  sed -i -e "s/sha512sums=.*/sha512sums=('SKIP')/" PKGBUILD

pkgsum: remove-pkgsum
  updpkgsums
  makepkg --printsrcinfo > .SRCINFO

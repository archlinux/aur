. PKGBUILD
git clone https://$GITHUB_ACCESS_TOKEN@github.com/bartoszek/AUR-repo.git
cd AUR-repo
cp $TRAVIS_BUILD_DIR/$pkgname-$pkgver*.pkg.tar.xz $(pwd)
git add $pkgname-$pkgver*.pkg.tar.xz
git status
git commit -a -m "$pkgname $pkgver" -m "build_log: $TRAVIS_BUILD_WEB_URL" 
git push

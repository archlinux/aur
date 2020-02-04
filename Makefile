default: build

build: clean namcap
	rm Gemfile.lock
	bundle install
	bundle exec ruby update.rb
	makepkg
	makepkg --printsrcinfo > .SRCINFO

clean:
	git clean -fd
	rm -rf pkg src *.deb *.tar.xz

namcap:
	namcap PKGBUILD

# too many failures we can't correct due to PKGBUILD design
shellcheck:
	shellcheck PKGBUILD

vet: namcap shellcheck

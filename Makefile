# Variables passed by user
#   PKGNAME (mandatory for some targets)
#   DESTDIR (optional)

# Constants
BINDIR=/usr/bin/
LIBDIR=/usr/lib/

.PHONY: all
all: install add-xfce4-launcher

.PHONY: install
install:
	install -Dm0555 toggle-bluetooth.sh '$(DESTDIR)$(BINDIR)'toggle-bluetooth

.PHONY: add-xfce4-launcher
add-xfce4-launcher:
	./xfce4-add-launcher.sh
	xfce4-panel -r

.PHONY: check
check:
	[ '$(PKGNAME)' != '' ]  # User variable PKGNAME must not be empty

# This does not remove the launcher from xfce4
.PHONY: clean
clean:
	rm '$(DESTDIR)$(BINDIR)'toggle-bluetooth

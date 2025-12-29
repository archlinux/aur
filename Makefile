.PHONY: install uninstall test

PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin

install:
	@echo "Installing shield-cleaner to $(BINDIR)..."
	install -Dm755 shield-cleaner.sh $(DESTDIR)$(BINDIR)/shield-cleaner
	@echo "Installation complete! Run 'shield-cleaner' to start."

uninstall:
	@echo "Uninstalling shield-cleaner..."
	rm -f $(DESTDIR)$(BINDIR)/shield-cleaner
	@echo "Uninstall complete."

test:
	@echo "Running dry-run test..."
	./shield-cleaner.sh -d -v
	@echo "Test complete."

local-install:
	@echo "Installing locally to ~/.local/bin..."
	install -Dm755 shield-cleaner.sh ~/.local/bin/shield-cleaner
	@echo "Local installation complete!"
	@echo "Make sure ~/.local/bin is in your PATH"

clean:
	@echo "Cleaning build artifacts..."
	rm -f *.tar.gz *.sig
	@echo "Clean complete."

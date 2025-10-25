# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Structure

This repository contains the **fredon-menu** project - a modern, customizable application launcher for Hyprland/Wayland environments. The project is organized as follows:

- `src/fredon-menu-git/` - Main Python application source code
- `src/fredon-menu-git/aur-submission/fredon-menu-git/` - AUR package submission files
- `PKGBUILD` - Arch Linux package build script for AUR submission
- `.SRCINFO` - AUR package metadata

## Core Application Architecture

### Python Application (GTK3 + Wayland)
- **Entry Point**: `src/fredon-menu-git/src/menu/app.py:main()` - Main application class with CLI handling
- **Window System**: `src/fredon-menu-git/src/menu/window.py` - GTK window with Wayland layer shell integration
- **Configuration**: `src/fredon-menu-git/src/menu/config.py` - JSON configuration file monitoring and validation
- **UI Components**: `src/fredon-menu-git/src/menu/button.py` - Custom button widgets with icon support
- **Models**: `src/fredon-menu-git/src/menu/models.py` - Data models for menu configuration and state
- **Command Launcher**: `src/fredon-menu-git/src/menu/launcher.py` - Command execution with desktop notification support

### Technology Stack
- **Python 3.11+** with PyGObject for GTK3 integration
- **gtk-layer-shell** for Wayland layer shell support (proper positioning/layering)
- **Pillow** for icon processing and scaling
- **watchdog** for real-time configuration file monitoring
- **libnotify** (optional) for desktop notifications

## Development Commands

### Prerequisites Installation
```bash
# Install required system dependencies
sudo pacman -S python python-gobject gtk3 gtk-layer-shell gdk-pixbuf2 python-pillow python-watchdog
```

### Application Development
```bash
# Navigate to application directory
cd src/fredon-menu-git

# Install in development mode
pip install -e .

# Run the application
fredon-menu
# or with debug logging
fredon-menu --debug

# Run tests
pytest tests/
```

### Code Quality Tools
```bash
# Format code
black src/

# Lint code
flake8 src/

# Type checking
mypy src/
```

### AUR Package Development
```bash
# Build package
makepkg -si

# Test package build (without installing)
makepkg -f

# Generate .SRCINFO
makepkg --printsrcinfo > .SRCINFO
```

## Key Features and Implementation

### Wayland Integration
The application uses gtk-layer-shell for proper Wayland integration:
- **Layer positioning**: OVERLAY layer with edge anchoring for centered display
- **Keyboard exclusive mode**: Captures all keyboard input when visible
- **Margin-based centering**: Uses window margins rather than absolute positioning

### Configuration System
- **JSON-based configuration** at `~/.config/fredon-menu/config.json`
- **Real-time monitoring** using Python's watchdog library
- **Hot reloading** with user notifications for configuration changes
- **Validation and error handling** with graceful fallbacks

### UI Architecture
- **Glass-like visual effects** with customizable blur, transparency, and theming
- **Pagination support** for handling large numbers of applications
- **Category-based organization** with hierarchical navigation
- **Icon caching and scaling** with multi-resolution support
- **Keyboard navigation** with arrow keys, escape, and backspace

### Command Execution
- **Multiple button types**: Applications, commands, directories, etc.
- **Desktop notifications** for launch feedback
- **Error handling** with user-friendly messages
- **PID file management** for single instance behavior

## Build Configuration Fixes

This repository includes fixes for common AUR build issues:

### PKGBUILD pkgver() Function
The `pkgver()` function includes fallback handling for repositories without git tags:
```bash
pkgver() {
    cd "$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-//g'
    else
        echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    fi
}
```

## Getting Started

1. **Set up development environment**:
   ```bash
   cd src/fredon-menu-git
   python -m venv venv
   source venv/bin/activate
   pip install -e .
   ```

2. **Configure the menu**:
   ```bash
   mkdir -p ~/.config/fredon-menu
   cp src/data/default.json ~/.config/fredon-menu/config.json
   ```

3. **Add Hyprland hotkey** (in `~/.config/hypr/hyprland.conf`):
   ```ini
   bind = $mainMod, space, exec, fredon-menu
   ```

4. **Run the application**:
   ```bash
   fredon-menu --debug
   ```

## Common Issues and Solutions

- **AUR Build Failures**: Ensure git tags exist or the PKGBUILD has the fallback pkgver() function
- **Wayland Issues**: Verify gtk-layer-shell is properly installed and Hyprland is running
- **Icon Loading**: Check that proper icon themes are installed and paths are correct
- **Configuration Monitoring**: Verify user permissions for `~/.config/fredon-menu/` directory

## Architecture Patterns

- **MVC Pattern**: Separation of concerns with models, views (GTK), and controllers
- **Observer Pattern**: Configuration changes trigger UI updates automatically
- **Factory Pattern**: Button creation based on type and configuration
- **Strategy Pattern**: Different command execution strategies for various button types
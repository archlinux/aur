# Contributing to libexecinfo

Thank you for your interest in contributing to libexecinfo! This guide will help you get started with contributing to this modern BSD-licensed backtrace library.

## 🎯 Project Overview

libexecinfo is a modern, cross-platform implementation of the backtrace facility found in GNU libc. Our goal is to provide a reliable, performant, and maintainable library that serves as a drop-in replacement for systems that lack built-in backtrace support.

## 🚀 Getting Started

### Prerequisites

Before contributing, make sure you have:

- **C Compiler**: GCC 7+ or Clang 6+
- **Python**: 3.6+ (for code generation)
- **Make**: GNU Make
- **Git**: For version control
- **Development tools**: Standard POSIX utilities (autotools, pkg-config, etc.)

### Development Environment Setup

1. **Fork and Clone**
   ```bash
   # Fork the repository on GitHub first, then:
   git clone https://github.com/YOUR_USERNAME/libexecinfo.git
   cd libexecinfo
   
   # Add upstream remote
   git remote add upstream https://github.com/fam007e/libexecinfo.git
   ```

2. **Generate Source Files**
   ```bash
   # Generate the stacktraverse.c file with default depth
   python gen.py --max-depth 128 --output stacktraverse.c
   ```

3. **Build and Test**
   ```bash
   # Debug build for development
   make DEBUG=1 clean all
   
   # Run tests to ensure everything works
   make test
   ```

## 🎨 Code Style and Standards

### C Code Style

We follow a consistent C coding style based on modern C11 standards:

```c
// Function declarations
int function_name(int param1, const char *param2);

// Variable declarations
int variable_name = 0;
const char *string_pointer = NULL;

// Structure definitions
struct example_struct {
    int member_one;
    char *member_two;
};

// Control structures
if (condition) {
    // code
} else {
    // code
}

for (int i = 0; i < limit; i++) {
    // code
}
```

### Key Guidelines

- **Indentation**: 4 spaces (no tabs)
- **Line length**: Maximum 80 characters
- **Braces**: Opening brace on same line for functions and control structures
- **Naming**: snake_case for functions and variables, UPPER_CASE for constants
- **Comments**: Use `/* */` for multi-line, `//` for single-line
- **Memory management**: Always check return values, avoid memory leaks
- **Error handling**: Comprehensive error checking and graceful failure

### Python Code Style

For the code generation scripts:

- Follow PEP 8 guidelines
- Use descriptive variable names
- Add docstrings for functions
- Use type hints where appropriate

## 🔧 Development Workflow

### Branch Strategy

1. **Main branch**: Always stable and ready for release
2. **Feature branches**: `feature/description-of-feature`
3. **Bug fix branches**: `fix/description-of-fix`
4. **Documentation branches**: `docs/description-of-change`

### Workflow Steps

1. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make changes**
   - Write code following our style guidelines
   - Add or update tests as needed
   - Update documentation if required

3. **Test thoroughly**
   ```bash
   # Run all tests
   make test
   
   # Test with different configurations
   make DEBUG=0 clean all test  # Release build
   make DEBUG=1 clean all test  # Debug build
   
   # Test with different stack depths
   python gen.py --max-depth 256 --output stacktraverse.c
   make clean all test
   ```

4. **Commit changes**
   ```bash
   git add .
   git commit -m "descriptive commit message"
   ```

5. **Push and create PR**
   ```bash
   git push origin feature/your-feature-name
   ```

## 🧪 Testing Guidelines

### Test Categories

1. **Unit Tests**: Test individual functions
2. **Integration Tests**: Test library integration
3. **Platform Tests**: Cross-platform compatibility
4. **Performance Tests**: Benchmark critical paths
5. **Memory Tests**: Memory safety and leak detection

### Writing Tests

When adding new functionality, include:

```c
// Example test structure
void test_new_feature() {
    // Setup
    void *buffer[64];
    int result;
    
    // Execute
    result = backtrace(buffer, 64);
    
    // Verify
    assert(result > 0);
    assert(result <= 64);
    
    // Cleanup (if needed)
}
```

### Running Tests

```bash
# All tests
make test

# Specific test categories
make test-unit
make test-integration
make test-performance

# Memory testing (if available)
make test-memory
```

## 📝 Documentation

### Code Documentation

- **Functions**: Document all public functions with doxygen-style comments
- **Complex logic**: Explain non-obvious code sections
- **Platform-specific code**: Document platform differences

```c
/**
 * @brief Capture stack backtrace
 * @param buffer Array to store return addresses
 * @param size Maximum number of addresses to capture
 * @return Number of addresses actually captured, or -1 on error
 * 
 * This function captures the current call stack by walking the
 * stack frames and storing return addresses in the provided buffer.
 */
int backtrace(void **buffer, int size);
```

### README and Documentation Updates

- Update README.md for user-visible changes
- Update API documentation for interface changes
- Add examples for new features
- Update build instructions for new requirements

## 🐛 Bug Reports and Issues

### Before Reporting

1. Search existing issues
2. Test with latest version
3. Reproduce with minimal example
4. Test on multiple platforms if possible

### Bug Report Template

When filing a bug report, include:

- **Environment**: OS, compiler, version
- **Steps to reproduce**: Minimal example
- **Expected behavior**: What should happen
- **Actual behavior**: What actually happens
- **Additional context**: Logs, stack traces, etc.

## 🎉 Feature Requests

### Guidelines for Feature Requests

- **Clear description**: What feature do you want?
- **Use case**: Why is this feature needed?
- **Compatibility**: How does this affect existing code?
- **Implementation ideas**: Any thoughts on implementation?

### Feature Development Process

1. **Discussion**: Open an issue to discuss the feature
2. **Design**: Agreement on approach and API
3. **Implementation**: Code the feature with tests
4. **Review**: Code review and iteration
5. **Documentation**: Update docs and examples
6. **Release**: Include in next release

## 🔄 Code Review Process

### What We Look For

- **Correctness**: Does the code work as intended?
- **Style**: Follows project coding standards
- **Testing**: Adequate test coverage
- **Documentation**: Code is well documented
- **Performance**: No unnecessary performance regressions
- **Compatibility**: Maintains backward compatibility
- **Security**: No security vulnerabilities

### Review Timeline

- **Small changes**: Usually reviewed within 1-2 days
- **Large changes**: May take up to a week
- **Complex changes**: May require multiple review rounds

## 📦 Release Process

### Version Numbering

We follow semantic versioning (SemVer):
- **Major**: Breaking changes
- **Minor**: New features, backward compatible
- **Patch**: Bug fixes, backward compatible

### Release Checklist

1. Update version numbers
2. Update CHANGELOG.md
3. Run full test suite on all platforms
4. Update documentation
5. Create release tag
6. Update package repositories (AUR, etc.)

## 🤝 Community Guidelines

### Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help newcomers and answer questions
- Report unacceptable behavior

### Communication Channels

- **GitHub Issues**: Bug reports and feature requests
- **Pull Requests**: Code contributions and discussions
- **Email**: Direct contact for sensitive issues

## 🎯 Contribution Ideas

### Good First Issues

- Fix compiler warnings
- Improve error messages
- Add more test cases
- Update documentation
- Fix typos and formatting

### Advanced Contributions

- Platform-specific optimizations
- New debugging features
- Performance improvements
- Security enhancements
- Integration with other tools

## 📋 Checklist for Contributors

Before submitting a pull request:

- [ ] Code follows project style guidelines
- [ ] All tests pass (`make test`)
- [ ] New functionality includes tests
- [ ] Documentation is updated
- [ ] Commit messages are descriptive
- [ ] No unnecessary changes or formatting modifications
- [ ] Branch is up to date with main
- [ ] PR description explains the changes

## 🙏 Recognition

Contributors will be recognized in:
- CONTRIBUTORS.md file
- Release notes for significant contributions
- GitHub contributors list

## 📞 Getting Help

If you need help with contributing:

- Open a GitHub issue with the "help wanted" label
- Email the maintainer: faisalmoshiur@gmail.com
- Check existing issues and discussions

---

Thank you for contributing to libexecinfo! Your efforts help make this library better for everyone. 🎉